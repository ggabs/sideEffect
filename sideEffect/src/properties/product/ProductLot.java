// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ProductLot.java

package properties.product;

import abstraction.IDValuePair;

public interface ProductLot
    extends IDValuePair
{

    public abstract int getMeddev_item_seq();

    public abstract void setMeddev_item_seq(int i);

    public abstract long getId();

    public abstract void setId(long l);

    public abstract String getLot_no();

    public abstract void setLot_no(String s);
}
