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
    public void getBoardCreate(Board board)
    {
        sqlSession.insert("board.create", board);
    }

    @Override
    public List<Board> getBoardReadList()
    {
        return getBoardReadList("nickname","",1);
    }

    @Override
    public List<Board> getBoardReadList(String field, String query, int page)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("field", field);
        map.put("query", "%"+query+"%");
        map.put("page", (page-1)*5);
        
        LOG.info(map.get("page"));

        return sqlSession.selectList("board.read", map);
    }

    @Override
    public int getBoardReadCount(String field, String query) throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        map.put("field", field);
        map.put("query", "%"+query+"%");
        return sqlSession.selectOne("board.readCount", map);
    }

    @Override
    public Board getBoardReadOne(int id) throws Exception
    {
        return sqlSession.selectOne("board.readOne", id);
    }

    @Override
    public void getBoardUpdateHit(int id) throws Exception
    {
        sqlSession.update("board.updateHit", id);
    }
    
}
