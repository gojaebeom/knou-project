package kr.ac.knou.dao.board;

import java.util.List;

import kr.ac.knou.dto.board.Board;

public interface BoardDAO
{
    //게시물 리스트 : 아무런 인자값이 없이 받으면 기본 검색 옵션: title, 검색어 : null, 페이지번호: 1
    public List<Board> selectBoards() throws Exception;

    //게시물 리스트 : 검색어, 페이지번호 를 기준으로 값 반환
    public List<Board> selectBoards(String query, int page) throws Exception;
    
    //회원 상세보기 : 회원이 작성한 글 
    public List<Board> selectBoardsForUserId(int id) throws Exception;
    
    //회원 상세보기 - 작성한 글 : 회원이 작성한 글
    public List<Board> selectBoardsForUserId(int id, int page) throws Exception;
    
    //보여줄 게시물들의 총 수량
    public int selectBoardCount(String query) throws Exception;
    
    //회원이 작성한 글 총 수량
    public int selectBoardCountForUserId(int id) throws Exception;

    //게시물 상세보기
    public Board selectBoardForId(int id) throws Exception;
    
    //가장 최근에 insert된 값의 id 가져오기
    public int selectLastInsertId() throws Exception;
    
    //게시물 생성
    public int insertBoard(Board board);

    //게시물 조회수 업데이트
    public void updateBoardHit(int id) throws Exception;
    
    //게시물 댓글 카운트 업데이트
    public int updateBoardCommentCnt(int id) throws Exception;
    
    //게시판 추천 카운트 업데이트
    public int updateBoardLikeCnt(int id) throws Exception;
    
    //게시물 수정
    public int updateBoard(Board board) throws Exception;
    
    //게시물 삭제
    public int deleteBoard(int id) throws Exception;

    
 
}
