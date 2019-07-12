package impl;

import java.util.ArrayList;

import entity.Adm;
import entity.Car;
import entity.Shop;

public interface oneimpl {
	public abstract boolean login(Adm adm);
	public abstract ArrayList<Shop> selectshop();
	public abstract Shop selectshopbyid(int id);
}
