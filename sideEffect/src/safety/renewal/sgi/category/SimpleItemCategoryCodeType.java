// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SimpleItemCategoryCodeType.java

package safety.renewal.sgi.category;

import abstraction.IDValuePair;

public class SimpleItemCategoryCodeType
    implements IDValuePair
{

    public SimpleItemCategoryCodeType()
    {
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getPropertyValue()
    {
        return propertyValue;
    }

    public void setPropertyValue(String propertyValue)
    {
        this.propertyValue = propertyValue;
    }

    private long id;
    private String propertyValue;
}
