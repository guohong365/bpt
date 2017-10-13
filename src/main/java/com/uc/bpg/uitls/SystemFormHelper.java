package com.uc.bpg.uitls;

import com.uc.utils.TreeNode;
import com.uc.web.domain.Code;
import com.uc.web.domain.CodeImpl;
import com.uc.web.domain.Menu;
import com.uc.web.domain.MenuTree;
import com.uc.web.forms.ui.TreeView;
import com.uc.web.forms.ui.TreeViewNode;


public class SystemFormHelper {
	public static Code createCodetable(Long code, String value, boolean valid){
		Code codeTable=new CodeImpl(code, value, valid);
		return codeTable;
	}
	
	public static Code createAllOption(){
		return createCodetable((long) 0, "所有", true);
	}
	
	public static Code createSelecetOption(String value) {
		return createCodetable((long) 0, value, true);
	}
	
	static void addMenuNode(TreeView treeView, 
			TreeViewNode parent, 
			TreeNode<Menu> menuitem){
		TreeViewNode current=menuitem.getData()==null ? parent : 
			treeView.add(parent, new TreeViewNode(menuitem.getData().getName(), menuitem.getData().getName(), menuitem.getData()));
		for(TreeNode<Menu> item: menuitem.getChildren()){
			addMenuNode(treeView, current, item);
		}
	}
	public static TreeView buildMenuTreeView(MenuTree menuTree){
		TreeView treeView= new TreeView();
		addMenuNode(treeView, treeView.getRoot(), menuTree.getRoot());
		return treeView;
	}
}
