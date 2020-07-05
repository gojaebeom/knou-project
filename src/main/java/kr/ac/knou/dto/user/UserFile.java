package kr.ac.knou.dto.user;

import java.util.Date;

public class UserFile
{
    private int id;
    private int userId;
    private String originFileName;
    private String storedFileName;
    private long fileSize;
    private Date createdAt;
    private int isDeleted;
    
    public UserFile()
    {
        
    }
    
   
    public UserFile(int id, int userId, String originFileName,
            String storedFileName, long fileSize, Date createdAt, int isDeleted)
    {
        super();
        this.id = id;
        this.userId = userId;
        this.originFileName = originFileName;
        this.storedFileName = storedFileName;
        this.fileSize = fileSize;
        this.createdAt = createdAt;
        this.isDeleted = isDeleted;
    }



    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public String getOriginFileName()
    {
        return originFileName;
    }

    public void setOriginFileName(String originFileName)
    {
        this.originFileName = originFileName;
    }

    public String getStoredFileName()
    {
        return storedFileName;
    }

    public void setStoredFileName(String storedFileName)
    {
        this.storedFileName = storedFileName;
    }

    public long getFileSize()
    {
        return fileSize;
    }

    public void setFileSize(long fileSize)
    {
        this.fileSize = fileSize;
    }

    public Date getCreatedAt()
    {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt)
    {
        this.createdAt = createdAt;
    }

    public int getIsDeleted()
    {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted)
    {
        this.isDeleted = isDeleted;
    }


    @Override
    public String toString()
    {
        return "UserFile [id=" + id + ", userId=" + userId + ", originFileName="
                + originFileName + ", storedFileName=" + storedFileName
                + ", fileSize=" + fileSize + ", createdAt=" + createdAt
                + ", isDeleted=" + isDeleted + "]";
    }
    
}
