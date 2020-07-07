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

@Repository
public class BoardDAOImpl implements BoardDAO
{
    @Autowired
    private SqlSession sqlSession;
    
    private static final Log LOG = LogFactory.getLog(BoardDAOImpl.class);

    
    @Override
    public List<Board> selectBoards()  throws Exception
    {
        return selectBoards("nickname","",1);
    }
    
    @Override
    public List<Board> selectBoards(String field, String query, int page) throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        map.put("field", field);
        map.put("query", "%"+query+"%");
        map.put("page", (page-1)*5);
        
        LOG.info(map.get("page"));

        return sqlSession.selectList("board.selectBoards", map);
    }
    
    @Override
    public List<Board> selectBoardsForUserId(int id) throws Exception
    {
        return sqlSession.selectList("board.selectBoardsForUserId", id);
    }  
    
    @Override
    public List<Board> selectBoardsForUserId(int id, int page) throws Exception
    {
        Map<String, Integer> map = new HashMap<>();
        map.put("id", id);
        map.put("page", (page-1)*5);
        return sqlSession.selectList("board.selectBoardsForUserId_Page", map);
    }

    
    @Override
    public int selectBoardCount(String field, String query) throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        map.put("field", field);
        map.put("query", "%"+query+"%");
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
        return sqlSession.selectOne("board.selectBoardForId", id);
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
    public int updateBoard(Board board) throws Exception
    {
        // TODO Auto-generated method stub
        return sqlSession.update("board.updateBoard", board);
    }

    @Override
    public int deleteBoard(int id) throws Exception
    {
        return sqlSession.delete("board.deleteBoard", id);
    }

   
    
}
