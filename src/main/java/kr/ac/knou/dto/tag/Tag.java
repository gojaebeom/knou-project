package kr.ac.knou.dto.tag;

public class Tag
{
    private int id;
    private int boardId;
    private String tagName;
    private int total;
    
    public Tag()
    {
        
    }

    public Tag(int id, int boardId, String tagName, int total)
    {
        super();
        this.id = id;
        this.boardId = boardId;
        this.tagName = tagName;
        this.total = total;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getBoardId()
    {
        return boardId;
    }

    public void setBoardId(int boardId)
    {
        this.boardId = boardId;
    }

    public String getTagName()
    {
        return tagName;
    }

    public void setTagName(String tagName)
    {
        this.tagName = tagName;
    }

    public int getTotal()
    {
        return total;
    }

    public void setTotal(int total)
    {
        this.total = total;
    }

    @Override
    public String toString()
    {
        return "Tag [id=" + id + ", boardId=" + boardId + ", tagName=" + tagName
                + ", total=" + total + "]";
    }
    
    
}
