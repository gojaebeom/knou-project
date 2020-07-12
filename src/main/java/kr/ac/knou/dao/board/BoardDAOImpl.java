package kr.ac.knou.dao.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.knou.dto.board.Board;
import kr.ac.knou.util.TIME_MAXIMUM;

@Repository
public class BoardDAOImpl implements BoardDAO
{
    @Autowired
    private SqlSession sqlSession;
    
    private static final Log LOG = LogFactory.getLog(BoardDAOImpl.class);

    
    @Override
    public List<Board> selectBoards()  throws Exception
    {
        return selectBoards("",1);
    }
    
    @Override
    public List<Board> selectBoards(String query, int page) throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        map.put("query", query);
        map.put("page", (page-1)*5);
        
        LOG.info(map.get("page"));

        List<Board> boardList = sqlSession.selectList("board.selectBoards", map);
        for(Board board : boardList)
        {
            board.setFormatTime(TIME_MAXIMUM.formatTimeString(board.getCreatedAt()));
        }
        return boardList;
    }
    
    @Override
    public List<Board> selectBoardsForUserId(int id) throws Exception
    {
        List<Board> boardList = sqlSession.selectList("board.selectBoardsForUserId", id);
        for(Board board : boardList)
        {
            board.setFormatTime(TIME_MAXIMUM.formatTimeString(board.getCreatedAt()));
        }
        
        return boardList;
    }  
    
    @Override
    public List<Board> selectBoardsForUserId(int id, int page) throws Exception
    {
        Map<String, Integer> map = new HashMap<>();
        map.put("id", id);
        map.put("page", (page-1)*5);
        List<Board> boardList =  sqlSession.selectList("board.selectBoardsForUserId_Page", map);
        
        for(Board board : boardList)
        {
            board.setFormatTime(TIME_MAXIMUM.formatTimeString(board.getCreatedAt()));
        }
        
        return boardList;
    }

    
    @Override
    public int selectBoardCount(String query) throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        map.put("query", query);
        return sqlSession.selectOne("board.selectBoardCount", map);
    }

    @Override
    public int selectBoardCountForUserId(int id) throws Exception
    {
        return sqlSession.selectOne("board.selectBoardCountForUserId", id);
    }
    
    @Override
    public Board selectBoardForId(int id) throws Exception
    {
        Board board = sqlSession.selectOne("board.selectBoardForId", id);
        LOG.info("가져온 게시물 정보 :"+board.toString());
        board.setFormatTime(TIME_MAXIMUM.formatTimeString(board.getCreatedAt()));
        
        return board;
    }
    
    @Override
    public int selectLastInsertId()
    {
        return sqlSession.selectOne("board.selectLastInsertId");
    }
    
    @Override
    public int insertBoard(Board board)
    {
        Integer result = sqlSession.insert("board.insertBoard", board);
        
        return (result != null) ? result : 0;
    }

    @Override
    public void updateBoardHit(int id) throws Exception
    {
        sqlSession.update("board.updateBoardHit", id);
    }
    
    @Override
    public int updateBoardCommentCnt(int id) throws Exception
    {
        return sqlSession.update("board.updateBoardCommentCnt", id);
    }
    
    @Override
    public int updateBoardLikeCnt(int id) throws Exception
    {
        return sqlSession.update("board.updateBoardLikeCnt", id);
    }
    
    @Override
    public int updateBoard(Board board) throws Exception
    {
        return sqlSession.update("board.updateBoard", board);
    }

    @Override
    public int deleteBoard(int id) throws Exception
    {
        return sqlSession.delete("board.deleteBoard", id);
    }

    

   
    
}
