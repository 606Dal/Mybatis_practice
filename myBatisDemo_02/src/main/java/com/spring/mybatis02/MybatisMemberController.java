package com.spring.mybatis02;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mybatis02.model.MybatisMember;
import com.spring.mybatis02.model.MybatisMemberMapper;

@Controller
//mybatisMember라는 이름으로 세션 객체 생성. 수정할 때 데이터 유지를 위해서 사용
@SessionAttributes("mybatisMember")
public class MybatisMemberController {
	
	@Autowired
	MybatisMemberMapper mybatisMemberService;
	
	//회원 가입을 위한 입력 부분
	@RequestMapping("/inputForm")
	public void insertMember(Model model) {
		System.out.println("-------insertMember()-------");
		//jsp 파일의 form의 modelAttribute 부분, path의 이름을 매칭하기 위한 객체 생성
		model.addAttribute("mybatisMember", new MybatisMember());
	}//insertMember()
	
	//폼에서 유효성 검사 후 이동
	@RequestMapping("/insertOk")
	public String insertOk(@Valid MybatisMember mybatisMember, BindingResult result) {
//		System.out.println("-------insertOk()-------");
//		System.out.println("result : " + result);
		//에러가 있다면
		if(result.hasErrors()) {
			System.out.println("회원 가입시 오류가 발생하였습니다!");
			return "inputForm";
		}else {
			//위에서 정의한 MybatisMemberMapper. sql세션 템플릿을 이용하는 것.
			//에러가 없으면 DB에 저장
			mybatisMemberService.insetMember(mybatisMember);
//			return "joinOk"; //메세지 띄우는 뷰
			return "redirect:list";
		}
	}//insertOk()
	
	//회원 정보 수정
	@RequestMapping("/modifyMember/{id}") //get방식 대신 스프링에서 지원하는 방식 사용
	public String modifyMember(@PathVariable String id, Model model) {
		System.out.println("-------modifyMember()-------");
		//자신의 id에 해당하는 레코드를 얻어옴
		model.addAttribute("mybatisMember", mybatisMemberService.getMember(id));
		return "modifyForm";
	}
	
	//수정 폼 유효성 체크
	@RequestMapping("/modifyOk")
	public String modifyOk(@Valid MybatisMember mybatisMember, BindingResult result) {
		//오류가 있다면
		if (result.hasErrors()) {
			System.out.println("회원 정보 수정에 오류가 발생하였습니다!");
			/* System.out.println(result); */
			return "modifyForm";
		}else {
			//없으면 업데이트
			mybatisMemberService.updateMember(mybatisMember);
//			return "updateResult";
			return "redirect:list";
		}
	}//modifyOk()
	
	//삭제 페이지를 보기 위한 경로
	@RequestMapping("/delMember")
	public void delMember(Model model) {
		model.addAttribute("mybatisMember", new MybatisMember());
	}
	
	//회원 정보 삭제
	@RequestMapping("/delMember/{id}")
	public String delMember(@PathVariable String id, Model model) {
		System.out.println("-------delMember()-------");
		
		//id가 존재하면
		if(mybatisMemberService.getMember(id) != null) {
			//멤버를 얻어와서 삭제
			model.addAttribute("mybatisMember", mybatisMemberService.getMember(id));
			return "delMember";
		}else { //id가 null이면
			return "delFail";
		}
	}//delMember()
	
	//delMember에서 삭제 버튼 눌렀을 때
	@RequestMapping("/deleteOk")
	public String deleteOk(@Valid MybatisMember mybatisMember, BindingResult result) {
//		if(result.hasErrors()) : hasErrors는 여러개의 필드 오류를 체크. 여기서는 id 하나만 확인하면 됨
		if(result.getFieldErrorCount(mybatisMember.getId()) > 0) {
			System.out.println("삭제 오류 발생.");
			return "delMember";
		}else {
			mybatisMemberService.deleteMember(mybatisMember.getId());
//			return "delOk";
			return "redirect:list";
		}
	}//deleteOk()
	
	//회원 목록 보기
	@RequestMapping("/list")
	public void list(Model model) {
		System.out.println("-------list()-------");
		//getAllMembers()의 리턴값이 list라서 여기서는 ArrayList로 받아줌
		ArrayList<MybatisMember> mybatisMembers =
				(ArrayList<MybatisMember>) mybatisMemberService.getAllMembers();
		model.addAttribute("mybatisMembers", mybatisMembers); //뷰에서 활용 가능
	}
	
}
