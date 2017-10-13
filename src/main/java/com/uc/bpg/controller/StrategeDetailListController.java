package com.uc.bpg.controller;

import org.springframework.ui.Model;

import com.uc.bpg.domain.Stratege;
import com.uc.bpg.forms.StrategeQueryForm;
import com.uc.web.controller.DetailListController;

public interface StrategeDetailListController extends DetailListController<Long, Stratege, StrategeQueryForm> {			
	String getCurrent(Model model);
	String getListHistory(StrategeQueryForm queryForm, Model model);
}
