// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JuncItemType.java

package safety.renewal.sgi.item;

import abstraction.IDValuePair;

public interface JuncItemType
    extends IDValuePair
{

    public abstract long getId();

    public abstract void setId(long l);

    public abstract long getType_id();

    public abstract void setType_id(long l);

    public abstract int getItem_id();

    public abstract void setItem_id(int i);
}