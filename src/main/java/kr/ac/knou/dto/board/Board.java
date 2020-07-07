package kr.ac.knou.dto.board;

import java.util.Date;
import java.util.List;

import kr.ac.knou.dto.comment.Comment;
import kr.ac.knou.dto.tag.Tag;
import kr.ac.knou.dto.user.User;

public class Board
{
    private int id;
    private int writerId; 
    private String title;   
    private String content;  
    private String files;    
    private Date createdAt;    
    private int hit;    
    private int commentCnt;    
    
    private User user;   
    private Comment comment;   
    private List<Tag> tagList;
    
    public Board()
    {
        
    }
    
    public Board(int id, int writerId, String title, String content,
            String files, Date createdAt, int hit, int commentCnt, User user,
            Comment comment, List<Tag> tagList)
    {
        super();
        this.id = id;
        this.writerId = writerId;
        this.title = title;
        this.content = content;
        this.files = files;
        this.createdAt = createdAt;
        this.hit = hit;
        this.commentCnt = commentCnt;
        this.user = user;
        this.comment = comment;
        this.tagList = tagList;
    }
    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id = id;
    }
    public int getWriterId()
    {
        return writerId;
    }
    public void setWriterId(int writerId)
    {
        this.writerId = writerId;
    }
    public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }
    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    public String getFiles()
    {
        return files;
    }
    public void setFiles(String files)
    {
        this.files = files;
    }
    public Date getCreatedAt()
    {
        return createdAt;
    }
    public void setCreatedAt(Date createdAt)
    {
        this.createdAt = createdAt;
    }
    public int getHit()
    {
        return hit;
    }
    public void setHit(int hit)
    {
        this.hit = hit;
    }
    public int getCommentCnt()
    {
        return commentCnt;
    }
    public void setCommentCnt(int commentCnt)
    {
        this.commentCnt = commentCnt;
    }
    public User getUser()
    {
        return user;
    }
    public void setUser(User user)
    {
        this.user = user;
    }
    public Comment getComment()
    {
        return comment;
    }
    public void setComment(Comment comment)
    {
        this.comment = comment;
    }
    public List<Tag> getTagList()
    {
        return tagList;
    }
    public void setTagList(List<Tag> tagList)
    {
        this.tagList = tagList;
    }

    @Override
    public String toString()
    {
        return "Board [id=" + id + ", writerId=" + writerId + ", title=" + title
                + ", content=" + content + ", files=" + files + ", createdAt="
                + createdAt + ", hit=" + hit + ", commentCnt=" + commentCnt
                + ", user=" + user + ", comment=" + comment + ", tagList="
                + tagList + "]";
    }
    
    
    
    
}