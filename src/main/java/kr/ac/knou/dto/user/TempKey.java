package kr.ac.knou.dto.user;

import java.util.Random;

public class TempKey
{
    private int size;
    private boolean lowerCheck;
    
    public String getKey(int size, boolean lowerCheck)
    {
        this.size = size;
        this.lowerCheck = lowerCheck;
        
        return init();
    }
    
    private String init()
    {
        Random random = new Random();
        StringBuffer buff = new StringBuffer();
        
        int num = 0;
        
        do
        {
            num = random.nextInt(75)+48;
            if((num >= 48 && num <= 57)||(num >= 65 && num <= 90)||(num >= 97 && num <= 122))
            {
                buff.append((char)num);
            }else
            {
                continue;
            }
        }while(buff.length() < size);
        
        if(lowerCheck)
        {
            return buff.toString().toLowerCase();
        }

        return buff.toString();
    }
}
