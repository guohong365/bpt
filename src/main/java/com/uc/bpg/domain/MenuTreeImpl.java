package com.uc.bpg.domain;

import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.uc.utils.BasicTreeNode;
import com.uc.utils.TreeNode;
import com.uc.utils.TreeImpl;
import com.uc.web.domain.Menu;
import com.uc.web.domain.MenuTree;
import com.uc.web.domain.NoParentFoundException;
import com.uc.web.forms.MenuTreeItem;

public class MenuTreeImpl extends TreeImpl<Menu> implements MenuTree {
	private Logger logger;
	public static MenuTree buildMenuTree(List<? extends MenuTreeItem> items) throws NoParentFoundException{
		MenuTreeImpl menuTree=new MenuTreeImpl();
		for (MenuTreeItem menuTreeItem : items) {
			menuTree.addMenuItem(menuTreeItem);
		}
		supressEmpty(menuTree);
		return menuTree;
	}
	
	private static void supressEmpty(MenuTree menuTree) {
		
		Iterator<TreeNode<Menu>> iterator=menuTree.getRoot().getChildren().iterator();
		while(iterator.hasNext()){
			TreeNode<Menu> item=iterator.next();
			supressEmpty(item, iterator);
		}
	}
	
	private static void supressEmpty(TreeNode<Menu> node, Iterator<TreeNode<Menu>> current){
		if(node.hasChildren()){
			Iterator<TreeNode<Menu>> children=node.getChildren().iterator();
			while(children.hasNext()){
				TreeNode<Menu> item=children.next();
				supressEmpty(item, children);
			}
		}
		if(node.getData()!=null && StringUtils.isEmpty(node.getData().getUri()) && !node.hasChildren()){
			current.remove();
		}
	}
	
	
	public MenuTreeImpl() {
		logger=LoggerFactory.getLogger(getClass());
	}

	@Override
	public void	addMenuItem(Menu item) throws NoParentFoundException{
		if (item==null) return;
		logger.debug("add item {}-{}-{}", item.getId(), item.getName(), item.getParent());
		TreeNode<Menu> node=new BasicTreeNode<>(item);
		if(item.getParent()==null){
			logger.debug("{} no parent add to root", item.getId());
			getRoot().addChild(node);
			return;
		}
		
		TreeNode<Menu> parent=findItem(item.getParent());
		if(parent!=null){
			parent.addChild(node);
			return;
		}
		throw new NoParentFoundException(item.getParent()+"");
	}
	
	@Override
	public TreeNode<Menu> findItem(Object menuId){
		for(TreeNode<Menu> node:getRoot().getChildren()){
		   TreeNode<Menu> item=findItem(node, menuId);
		   if(item!=null) return item;
		}
		return null;
	}
	
	@Override
	public TreeNode<Menu> findItem(TreeNode<Menu> from, Object menuId){
		if(from.getData()!=null && from.getData().getId().equals(menuId)){
			logger.debug("found {}-{}", from.getData().getId(), from.getData().getName());
			return from;
		}
		for(TreeNode<Menu> item:from.getChildren()){
			TreeNode<Menu> subItem=findItem(item, menuId);
			if(subItem!=null) return subItem;
		}		
		return null;
	}

}
