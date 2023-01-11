package com.devpro.Drake.service;

import org.springframework.stereotype.Service;

import com.devpro.Drake.entities.SaleOrder;


@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}

}
