package kr.ac.knou.dto.board;


import java.util.Date;
import java.util.List;

import kr.ac.knou.dto.comment.Comment;
import kr.ac.knou.dto.like.Like;
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
    private Date updatedAt;
    private int hit;    
    private int commentCnt;    
    private int likeCnt;
    
    private User user;   
    private Comment comment;   
    private Like like;
    private List<Tag> tagList;
    
    public Board()
    {
        
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
    
    public Date getUpdatedAt()
    {
        return updatedAt;
    }
    public void setUpdatedAt(Date updatedAt)
    {
        this.updatedAt = updatedAt;
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

    public int getLikeCnt()
    {
        return likeCnt;
    }

    public void setLikeCnt(int likeCnt)
    {
        this.likeCnt = likeCnt;
    }
    public Like getLike()
    {
        return like;
    }
    public void setLike(Like like)
    {
        this.like = like;
    }
    @Override
    public String toString()
    {
        return "Board [id=" + id + ", writerId=" + writerId + ", title=" + title
                + ", content=" + content + ", files=" + files + ", createdAt="
                + createdAt + ", updatedAt=" + updatedAt + ", hit=" + hit
                + ", commentCnt=" + commentCnt + ", likeCnt=" + likeCnt
                + ", user=" + user + ", comment=" + comment + ", like=" + like
                + ", tagList=" + tagList + "]";
    }
    

}