package kr.ac.knou.dao.board;

import java.util.List;

import kr.ac.knou.dto.board.Board;

public interface BoardDAO
{
    //게시물 리스트 : 아무런 인자값이 없이 받으면 기본 검색 옵션: title, 검색어 : null, 페이지번호: 1
    public List<Board> selectBoards() throws Exception;

    //게시물 리스트 : 검색옵션, 검색어, 페이지번호 를 기준으로 값 반환
    public List<Board> selectBoards(String field, String query, int page) throws Exception;
    
    //보여줄 게시물들의 총 수량
    public int selectBoardCount(String field, String query) throws Exception;

    //게시물 상세보기
    public Board selectBoardForId(int id) throws Exception;
    
    //게시물 생성
    public void insertBoard(Board board);

    //게시물 조회수 업데이트
    public void updateBoardHit(int id) throws Exception;
 
}
