// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   IDValuePair.java

package abstraction;


public interface IDValuePair
{

    public abstract long getId();

    public abstract void setId(long l);

    public abstract String getPropertyValue();

    public abstract void setPropertyValue(String s);
}
