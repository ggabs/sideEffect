// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SimpleReporterType.java

package properties;


// Referenced classes of package properties:
//            ReporterType

public class SimpleReporterType
    implements ReporterType
{

    public SimpleReporterType()
    {
    }

    public long getId()
    {
        return id;
    }

    public void setId(long iD)
    {
        id = iD;
    }

    public String getPropertyValue()
    {
        return propertyValue;
    }

    public void setPropertyValue(String value)
    {
        propertyValue = value;
    }

    public Integer getType()
    {
        return Integer.valueOf(type);
    }

    public void setType(Integer type)
    {
        this.type = type.intValue();
    }

    private long id;
    private String propertyValue;
    private int type;
}
