package com.sic.ocms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sic.ocms.dao.checkitem.CheckitemDAO;
import com.sic.ocms.dao.checkitem.status.CheckitemStatusDAO;
import com.sic.ocms.dao.item.ItemDAO;
import com.sic.ocms.dto.ChecklistDO;
import com.sic.ocms.persistence.Checkitem;
import com.sic.ocms.persistence.CheckitemStatus;
import com.sic.ocms.persistence.Item;
import com.sic.ocms.util.easyui.DataGrid;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class ChecklistService {



	private DataGrid<ChecklistDO> dg = new DataGrid<ChecklistDO>();

	public DataGrid<ChecklistDO> getDataGrid() {

		List<Item> itemｓ = itemDAO.list("from Item");
		List<ChecklistDO> table = new ArrayList<ChecklistDO>();

		//上から表示したい順に挿入していく
		for(int n=1;n<itemｓ.size();n++){
			for(Item g1:itemｓ){
				if(g1.getParent().getItemId()==g1.getItemId()&&g1.getRank()==n){
					Set<Item> group2 = g1.getChildren();
					for(int j=1;j<=group2.size();j++){
						for(Item g2:group2){
							if(g2.getItemId()!=g2.getParent().getItemId()&&g2.getRank()==j){
								Set<Item> group3 = g2.getChildren();
								for(int k=1;k<=group3.size();k++){
									for(Item g3:group3){
										if(g3.getItemId()!=g3.getParent().getItemId()&&g3.getRank()==k){
											Set<Checkitem> checkitems = g3.getCheckitems();
											for(int i=1;i<=checkitems.size();i++){
												for(Checkitem checkitem:checkitems){
													if(checkitem.getRank()==i){
														Set<CheckitemStatus> checkitemstatuses = checkitem.getCheckitemstatus();
														for(CheckitemStatus checkitemstatus:checkitemstatuses){
															ChecklistDO row = new ChecklistDO();
															row.setGroup1Id(g1.getItemId());
															row.setGroup1Name(g1.getName());
															row.setGroup1Percentage(g1.getPercentage());
															row.setGroup2Name(g2.getName());
															row.setGroup2Percentage(g2.getPercentage());
															row.setGroup3Name(g3.getName());
															row.setGroup3Percentage(g3.getPercentage());
															row.setCheckitemContent(checkitem.getContent());
															row.setDescription(checkitem.getDescrition());
															row.setTypicalDeliverables(checkitem.getTypicalDeliverables());
															row.setCheckitemStatusId(checkitemstatus.getCheckItemStatusId());
															row.setStatus(checkitemstatus.getStatus());
															row.setProblem(checkitemstatus.getProblem());
															row.setComment(checkitemstatus.getComment());
															row.setPrjtype(checkitemstatus.getPrjtype());
															row.setImportance(checkitemstatus.getImportance());
															row.setCheckitemId(checkitem.getCheckitemId());
															table.add(row);
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		dg.setRows(table);
		dg.setTotal(table.size());

		return dg;
	}

	public void update(String rows) {

		JSONArray jArr = JSONArray.fromObject(rows);

		List<CheckitemStatus> checkitemstatuses = checkitemStatusDAO.list("from CheckitemStatus");

		CheckitemStatus updatedcheckitemstatus = new CheckitemStatus();

		for(int i=0;i<jArr.size();i++){
			JSONObject jObj = JSONObject.fromObject(jArr.get(i));

			updatedcheckitemstatus.setCheckItemStatusId(jObj.getInt("checkitemStatusId"));
			updatedcheckitemstatus.setStatus(jObj.getInt("status"));
			updatedcheckitemstatus.setProblem(jObj.getInt("problem"));
			updatedcheckitemstatus.setComment(jObj.getString("comment"));
			for (CheckitemStatus checkitemstatus : checkitemstatuses) {
				// 同じIDならアップデート
				if (updatedcheckitemstatus.getCheckItemStatusId() == checkitemstatus.getCheckItemStatusId()) {
					checkitemstatus.setStatus(updatedcheckitemstatus.getStatus());
					checkitemstatus.setComment(updatedcheckitemstatus.getComment());
					checkitemstatus.setProblem(updatedcheckitemstatus.getProblem());
					checkitemStatusDAO.update(checkitemstatus);
					//updateの時にいちいち全部の得点を計算をする必要はない？別個に関数を用意する？
					calculatePercentage();
				}
			}

		}
	}

	public void calculatePercentage(){

		List<Item> items = itemDAO.list("from Item");

		List<Item> group1 = new ArrayList<Item>();
		List<Item> group2 = new ArrayList<Item>();
		List<Item> group3 = new ArrayList<Item>();
		for(Item item:items){
			if(item.getChildren().size()==0){
				group3.add(item);
			}else if(item.getItemId()==item.getParent().getItemId()){
				group1.add(item);
			}else{
				group2.add(item);
			}
		}

		for(Item item:group3){//まずグループ3
			int completioncounter = 0;
			int correspondencecounter = 0;
			int notstartedcounter = 0;
			Set<Checkitem> checkitems = item.getCheckitems();
			for(Checkitem checkitem:checkitems){
				Set<CheckitemStatus> checkitemstatuses = checkitem.getCheckitemstatus();
				for(CheckitemStatus checkitemstatus:checkitemstatuses){
					if(checkitemstatus.getStatus()==5){
						completioncounter+=1;
					}else if(checkitemstatus.getStatus()==4){
						correspondencecounter+=1;
					}else if(checkitemstatus.getStatus()==3){
						notstartedcounter+=1;
					}
				}
			}
			double percentage;
			if(completioncounter+correspondencecounter+notstartedcounter==0){
				percentage=0.0;
			}else{
				percentage=(completioncounter+(correspondencecounter*0.5))/(completioncounter+correspondencecounter+notstartedcounter);
			}
			item.setPercentage(percentage*100);
			itemDAO.update(item);
		}

		for(Item item:group2){
			Set<Item> children = item.getChildren();
			int sum = 0;
			for(Item child:children){
				sum+=child.getPercentage();
			}
			item.setPercentage((double)sum/children.size());
			itemDAO.update(item);
		}

		for(Item item:group1){
			Set<Item> children = item.getChildren();
			int sum = 0;
			for(Item child:children){
				sum+=child.getPercentage();
			}
			item.setPercentage((double)sum/children.size());
			itemDAO.update(item);
		}
/*
		for(Item item:items){
			Double sum = 0.0;
			if(item.getChildren().size()==0){//最下層の場合

				Set<Checkitem> checkitems = item.getCheckitems();
				for(Checkitem checkitem:checkitems){
					Set<CheckitemStatus> checkitemstatuses = checkitem.getCheckitemstatus();
					for(CheckitemStatus checkitemstatus:checkitemstatuses){
						sum += checkitemstatus.getStatus();
					}
				}
			}else{//それ以外の場合
				Set<Item> children = item.getChildren();
				for(Item child:children){
					sum+=child.getPercentage();
				}

			}
			item.setPercentage(sum/item.getChildren().size());
			itemDAO.update(item);
		}
*/
	}

	private ItemDAO itemDAO;
	private CheckitemDAO checkitemDAO;
	private CheckitemStatusDAO checkitemStatusDAO;

	@Resource
	public void setItemDAO(ItemDAO itemDAO) {
		this.itemDAO = itemDAO;
	}

	@Resource
	public void setCheckitemDAO(CheckitemDAO checkitemDAO) {
		this.checkitemDAO = checkitemDAO;
	}

	@Resource
	public void setCheckitemStatusDAO(CheckitemStatusDAO checkitemStatusDAO) {
		this.checkitemStatusDAO = checkitemStatusDAO;
	}

}
