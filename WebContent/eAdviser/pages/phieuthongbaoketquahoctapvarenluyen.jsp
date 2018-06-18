<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Calendar cld = Calendar.getInstance();
	String ngay = cld.get(Calendar.DATE) + "";
	String thang = (cld.get(Calendar.MONTH) + 1) + "";
	String nam = cld.get(Calendar.YEAR) + "";

	String hocKy = "";
	String namHoc = "";
	String tenPhuHuynh = "";
	String tenSV = "";
	String tenLop = "";
	String khoa = "";
	String ketQuaRenLuyen = "";
	String xepLoaiRenLuyen = "";
	String thongBaoCuThe = "";
	String tenCVHT = "";
	String dienThoaiCoQuan = "";
	String dienThoaiDiDong = "";
	String diaChiGuiThu = "";
	String tenDonVi = "";

	String maDangNhap = session.getAttribute("maDangNhap") + "";
	if (maDangNhap.equals("null")) {
		response.sendRedirect("login.jsp");
	} else {
		hocKy = session.getAttribute("hocKy") + "";
		namHoc = session.getAttribute("namHoc") + "";
		tenPhuHuynh = session.getAttribute("tenPhuHuynh") + "";
		tenSV = session.getAttribute("tenSV") + "";
		tenLop = session.getAttribute("tenLop") + "";
		khoa = session.getAttribute("khoa") + "";
		ketQuaRenLuyen = session.getAttribute("ketQuaRenLuyen") + "";
		xepLoaiRenLuyen = session.getAttribute("xepLoaiRenLuyen") + "";
		thongBaoCuThe = session.getAttribute("thongBaoCuThe") + "";
		tenCVHT = session.getAttribute("tenCVHT") + "";
		dienThoaiCoQuan = session.getAttribute("dienThoaiCoQuan") + "";
		dienThoaiDiDong = session.getAttribute("dienThoaiDiDong") + "";
		diaChiGuiThu = session.getAttribute("diaChiGuiThu") + "";
		tenDonVi = session.getAttribute("tenDonVi") + "";
	}
%>
<script type="text/javascript">
function load(){
	window.print();
}
</script>
<html xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns:w="urn:schemas-microsoft-com:office:word"
	xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
	xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 15">
<meta name=Originator content="Microsoft Word 15">
<link rel=File-List
	href="thongbao_ketquahoctapvarenluyen_files/filelist.xml">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Windows User</o:Author>
  <o:Template>Normal</o:Template>
  <o:LastAuthor>Windows User</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>62</o:TotalTime>
  <o:Created>2018-06-05T05:37:00Z</o:Created>
  <o:LastSaved>2018-06-05T05:37:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Words>220</o:Words>
  <o:Characters>1260</o:Characters>
  <o:Lines>10</o:Lines>
  <o:Paragraphs>2</o:Paragraphs>
  <o:CharactersWithSpaces>1478</o:CharactersWithSpaces>
  <o:Version>15.00</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<link rel=dataStoreItem
	href="thongbao_ketquahoctapvarenluyen_files/item0006.xml"
	target="thongbao_ketquahoctapvarenluyen_files/props007.xml">
<link rel=themeData
	href="thongbao_ketquahoctapvarenluyen_files/themedata.thmx">
<link rel=colorSchemeMapping
	href="thongbao_ketquahoctapvarenluyen_files/colorschememapping.xml">
<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:TrackMoves>false</w:TrackMoves>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]-->
<!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="371">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
 </w:LatentStyles>
</xml><![endif]-->
<style>
<!-- /* Font Definitions */
@font-face {
	font-family: Calibri;
	panose-1: 2 15 5 2 2 2 4 3 2 4;
	mso-font-charset: 0;
	mso-generic-font-family: swiss;
	mso-font-pitch: variable;
	mso-font-signature: -536859905 -1073732485 9 0 511 0;
}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal {
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-parent: "";
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 8.0pt;
	margin-left: 0in;
	line-height: 107%;
	mso-pagination: widow-orphan;
	font-size: 11.0pt;
	font-family: "Calibri", "sans-serif";
	mso-ascii-font-family: Calibri;
	mso-ascii-theme-font: minor-latin;
	mso-fareast-font-family: Calibri;
	mso-fareast-theme-font: minor-latin;
	mso-hansi-font-family: Calibri;
	mso-hansi-theme-font: minor-latin;
	mso-bidi-font-family: "Times New Roman";
	mso-bidi-theme-font: minor-bidi;
}

p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph {
	mso-style-priority: 34;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 8.0pt;
	margin-left: .5in;
	mso-add-space: auto;
	line-height: 107%;
	mso-pagination: widow-orphan;
	font-size: 11.0pt;
	font-family: "Calibri", "sans-serif";
	mso-ascii-font-family: Calibri;
	mso-ascii-theme-font: minor-latin;
	mso-fareast-font-family: Calibri;
	mso-fareast-theme-font: minor-latin;
	mso-hansi-font-family: Calibri;
	mso-hansi-theme-font: minor-latin;
	mso-bidi-font-family: "Times New Roman";
	mso-bidi-theme-font: minor-bidi;
}

p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListParagraphCxSpFirst
	{
	mso-style-priority: 34;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-type: export-only;
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 0in;
	margin-left: .5in;
	margin-bottom: .0001pt;
	mso-add-space: auto;
	line-height: 107%;
	mso-pagination: widow-orphan;
	font-size: 11.0pt;
	font-family: "Calibri", "sans-serif";
	mso-ascii-font-family: Calibri;
	mso-ascii-theme-font: minor-latin;
	mso-fareast-font-family: Calibri;
	mso-fareast-theme-font: minor-latin;
	mso-hansi-font-family: Calibri;
	mso-hansi-theme-font: minor-latin;
	mso-bidi-font-family: "Times New Roman";
	mso-bidi-theme-font: minor-bidi;
}

p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListParagraphCxSpMiddle
	{
	mso-style-priority: 34;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-type: export-only;
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 0in;
	margin-left: .5in;
	margin-bottom: .0001pt;
	mso-add-space: auto;
	line-height: 107%;
	mso-pagination: widow-orphan;
	font-size: 11.0pt;
	font-family: "Calibri", "sans-serif";
	mso-ascii-font-family: Calibri;
	mso-ascii-theme-font: minor-latin;
	mso-fareast-font-family: Calibri;
	mso-fareast-theme-font: minor-latin;
	mso-hansi-font-family: Calibri;
	mso-hansi-theme-font: minor-latin;
	mso-bidi-font-family: "Times New Roman";
	mso-bidi-theme-font: minor-bidi;
}

p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParagraphCxSpLast
	{
	mso-style-priority: 34;
	mso-style-unhide: no;
	mso-style-qformat: yes;
	mso-style-type: export-only;
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 8.0pt;
	margin-left: .5in;
	mso-add-space: auto;
	line-height: 107%;
	mso-pagination: widow-orphan;
	font-size: 11.0pt;
	font-family: "Calibri", "sans-serif";
	mso-ascii-font-family: Calibri;
	mso-ascii-theme-font: minor-latin;
	mso-fareast-font-family: Calibri;
	mso-fareast-theme-font: minor-latin;
	mso-hansi-font-family: Calibri;
	mso-hansi-theme-font: minor-latin;
	mso-bidi-font-family: "Times New Roman";
	mso-bidi-theme-font: minor-bidi;
}

span.SpellE {
	mso-style-name: "";
	mso-spl-e: yes;
}

span.GramE {
	mso-style-name: "";
	mso-gram-e: yes;
}

.MsoChpDefault {
	mso-style-type: export-only;
	mso-default-props: yes;
	font-family: "Calibri", "sans-serif";
	mso-ascii-font-family: Calibri;
	mso-ascii-theme-font: minor-latin;
	mso-fareast-font-family: Calibri;
	mso-fareast-theme-font: minor-latin;
	mso-hansi-font-family: Calibri;
	mso-hansi-theme-font: minor-latin;
	mso-bidi-font-family: "Times New Roman";
	mso-bidi-theme-font: minor-bidi;
}

.MsoPapDefault {
	mso-style-type: export-only;
	margin-bottom: 8.0pt;
	line-height: 107%;
}

@page WordSection1 {
	size: 8.5in 11.0in;
	margin: 1.0in 1.0in 1.0in 1.0in;
	mso-header-margin: .5in;
	mso-footer-margin: .5in;
	mso-paper-source: 0;
}

div.WordSection1 {
	page: WordSection1;
}
/* List Definitions */
@
list l0 {
	mso-list-id: 1721131803;
	mso-list-type: hybrid;
	mso-list-template-ids: 731276000 -1808918854 67698713 67698715 67698703
		67698713 67698715 67698703 67698713 67698715;
}

@
list l0:level1 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 21.0pt;
	text-indent: -.25in;
}

@
list l0:level2 {
	mso-level-number-format: alpha-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 57.0pt;
	text-indent: -.25in;
}

@
list l0:level3 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 93.0pt;
	text-indent: -9.0pt;
}

@
list l0:level4 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 129.0pt;
	text-indent: -.25in;
}

@
list l0:level5 {
	mso-level-number-format: alpha-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 165.0pt;
	text-indent: -.25in;
}

@
list l0:level6 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 201.0pt;
	text-indent: -9.0pt;
}

@
list l0:level7 {
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 237.0pt;
	text-indent: -.25in;
}

@
list l0:level8 {
	mso-level-number-format: alpha-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: left;
	margin-left: 273.0pt;
	text-indent: -.25in;
}

@
list l0:level9 {
	mso-level-number-format: roman-lower;
	mso-level-tab-stop: none;
	mso-level-number-position: right;
	margin-left: 309.0pt;
	text-indent: -9.0pt;
}

ol {
	margin-bottom: 0in;
}

ul {
	margin-bottom: 0in;
}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin-top:0in;
	mso-para-margin-right:0in;
	mso-para-margin-bottom:8.0pt;
	mso-para-margin-left:0in;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
table.MsoTableGrid
	{mso-style-name:"Table Grid";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-priority:39;
	mso-style-unhide:no;
	border:solid windowtext 1.0pt;
	mso-border-alt:solid windowtext .5pt;
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-border-insideh:.5pt solid windowtext;
	mso-border-insidev:.5pt solid windowtext;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
</style>
<![endif]-->
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]-->
<!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=EN-US style='tab-interval: .5in' onload="load()">

	<div class=WordSection1>

		<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0
			width="100%"
			style='width: 100.0%; border-collapse: collapse; border: none; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: none; mso-border-insidev: none'>
			<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 4.0pt'>
				<td width="50%" valign=top
					style='width: 50.34%; padding: 0in 5.4pt 0in 5.4pt; height: 4.0pt'>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 12.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>TR&#431;&#7900;NG
								&#272;&#7840;I H&#7884;C GIAO THÔNG V&#7852;N T&#7842;I<o:p></o:p>
						</span></b>
					</p>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 12.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>PHÂN
								HI&#7878;U TP. H&#7890; CHÍ MINH<o:p></o:p>
						</span></b>
					</p>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 12.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>B&#7896;
								MÔN: <strong><%=tenDonVi%></strong></b>
					</p>
				</td>
				<td width="49%" valign=top
					style='width: 49.66%; padding: 0in 5.4pt 0in 5.4pt; height: 4.0pt'>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 12.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>C&#7896;NG
								HÒA XÃ H&#7896;I CH&#7910; NGH&#296;A VI&#7878;T NAM<o:p></o:p>
						</span></b>
					</p>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span class=SpellE><b style='mso-bidi-font-weight: normal'><span
								style='font-size: 12.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>&#272;&#7897;c</span></b></span><b
							style='mso-bidi-font-weight: normal'><span
							style='font-size: 12.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
								<span class=SpellE>l&#7853;p</span> – <span class=SpellE>T&#7921;</span>
								do – <span class=SpellE>H&#7841;nh</span> <span class=SpellE>phúc</span>
						</span></b><b style='mso-bidi-font-weight: normal'><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p></o:p></span></b>
					</p>
				</td>
			</tr>
			<tr style='mso-yfti-irow: 1'>
				<td width="50%" valign=top
					style='width: 50.34%; padding: 0in 5.4pt 0in 5.4pt'>
					<p class=MsoNormal
						style='margin-bottom: 0in; margin-bottom: .0001pt; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span></b>
					</p>
				</td>
				<td width="49%" valign=top
					style='width: 49.66%; padding: 0in 5.4pt 0in 5.4pt'>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span></b>
					</p>
				</td>
			</tr>
			<tr style='mso-yfti-irow: 2; mso-yfti-lastrow: yes'>
				<td width="100%" colspan=2 valign=top
					style='width: 100.0%; padding: 0in 5.4pt 0in 5.4pt'>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 14.0pt; mso-bidi-font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>THÔNG
								BÁO<o:p></o:p>
						</span></b>
					</p>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>K&#7870;T
								QU&#7842; H&#7884;C T&#7852;P VÀ RÈN LUY&#7878;N C&#7910;A SINH
								VIÊN<o:p></o:p>
						</span></b>
					</p>
					<p class=MsoNormal align=center
						style='margin-bottom: 0in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span class=SpellE><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>H&#7885;c</span></span><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
							<span class=SpellE>k&#7923;</span>: <%=hocKy%>&nbsp;
							<span class=SpellE>N&#259;m</span> <span class=SpellE>h&#7885;c</span>:
							<%=namHoc%><o:p></o:p>
						</span>
					</p>
				</td>
			</tr>
		</table>

		<p class=MsoNormal
			style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 8.0pt; margin-left: 2.0in; line-height: 115%'>
			<b style='mso-bidi-font-weight: normal'><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span></b>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>Kính</span></b></span><b
				style='mso-bidi-font-weight: normal'><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
					<span class=SpellE>g&#7917;i</span>: <span class=SpellE>Ông</span>
					<span class=SpellE>bà</span> <%=tenPhuHuynh%> <o:p></o:p>
			</span></b>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>Là</span></b></span><b
				style='mso-bidi-font-weight: normal'><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
					<span class=SpellE>ph&#7909;</span> <span class=SpellE>huynh</span>
					<span class=SpellE>c&#7911;a</span> <span class=SpellE>sinh</span>
					<span class=SpellE>viên</span>: <%=tenSV%> <o:p></o:p>
			</span></b>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><b style='mso-bidi-font-weight: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>L&#7899;p</span></b></span><b
				style='mso-bidi-font-weight: normal'><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>:
					<%=tenLop%> <span class=SpellE>Khóa</span>: <%=khoa%><o:p></o:p>
			</span></b>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>Tr&#432;&#7901;ng</span></span><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
				<span class=SpellE>&#272;&#7841;i</span> <span class=SpellE>h&#7885;c</span>
				<span class=SpellE>Giao</span> <span class=SpellE>Thông</span> <span
				class=SpellE>V&#7853;n</span> <span class=SpellE>T&#7843;i</span> <span
				class=SpellE>phân</span> <span class=SpellE>hi&#7879;u</span> <span
				class=SpellE>thành</span> <span class=SpellE>ph&#7889;</span> <span
				class=SpellE>H&#7891;</span> <span class=SpellE>Chí</span> Minh <span
				class=SpellE>xin</span> <span class=SpellE>g&#7917;i</span> <span
				class=SpellE>t&#7899;i</span> <span class=SpellE>ông</span> (<span
				class=SpellE>bà</span>) <span class=SpellE>k&#7871;t</span> <span
				class=SpellE>qu&#7843;</span> <span class=SpellE>h&#7885;c</span> <span
				class=SpellE>t&#7853;p</span> <span class=SpellE>và</span> <span
				class=SpellE>rèn</span> <span class=SpellE>luy&#7879;n</span> <span
				class=SpellE>c&#7911;a</span> <span class=SpellE>sinh</span> <span
				class=SpellE>viên</span> <span class=SpellE><span class=GramE>g&#7891;m</span></span><span
				class=GramE> <span style='mso-spacerun: yes'> </span><span
					class=SpellE>các</span></span> <span class=SpellE>n&#7897;i</span> dung <span
				class=SpellE>sau</span>:<o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<b style='mso-bidi-font-weight: normal'><i
				style='mso-bidi-font-style: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>1.
						<span class=SpellE>K&#7871;t</span> <span class=SpellE>qu&#7843;</span>
						<span class=SpellE>h&#7885;c</span> <span class=SpellE>t&#7853;p</span>:
				</span></i></b><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>(<span
				class=SpellE>g&#7917;i</span> <span class=SpellE>kèm</span> <span
				class=SpellE>b&#7843;ng</span> <span class=SpellE>&#273;i&#7875;m</span>
				<span class=SpellE>t&#7893;ng</span> <span class=SpellE>h&#7907;p</span>
				<span class=SpellE>c&#7911;a</span> <span class=SpellE>c&#7843;</span>
				<span class=SpellE>l&#7899;p</span> – Ban <span class=SpellE>&#272;ào</span>
				<span class=SpellE>t&#7841;o</span> <span class=SpellE>cung</span> <span
				class=SpellE>c&#7845;p</span>).<o:p></o:p></span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<b style='mso-bidi-font-weight: normal'><i
				style='mso-bidi-font-style: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>2.</span></i></b><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
				<span class=SpellE><b style='mso-bidi-font-weight: normal'><i
						style='mso-bidi-font-style: normal'>K&#7871;t</i></b></span><b
				style='mso-bidi-font-weight: normal'><i
					style='mso-bidi-font-style: normal'> <span class=SpellE>qu&#7843;</span>
						<span class=SpellE>rèn</span> <span class=SpellE>luy&#7879;n</span>:
				</i></b><%=ketQuaRenLuyen%> <span class=SpellE>X&#7871;p</span> <span
				class=SpellE>lo&#7841;i</span>: <%=xepLoaiRenLuyen%> <o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<b style='mso-bidi-font-weight: normal'><i
				style='mso-bidi-font-style: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>3.
						<span class=SpellE>Thông</span> <span class=SpellE>báo</span> <span
						class=SpellE>v&#7873;</span> <span class=SpellE>k&#7871;t</span> <span
						class=SpellE>qu&#7843;</span> <span class=SpellE>khen</span> <span
						class=SpellE>th&#432;&#7903;ng</span>, <span class=SpellE>k&#7929;</span>
						<span class=SpellE>lu&#7853;t</span> <span class=SpellE>ho&#7863;c</span>
						<span class=SpellE>nh&#7919;ng</span> <span class=SpellE>nh&#7853;n</span>
						<span class=SpellE>xét</span> <span class=SpellE>v&#7873;</span> <span
						class=SpellE>sinh</span> <span class=SpellE>viên</span> <span
						class=SpellE>trong</span> <span class=SpellE>h&#7885;c</span> <span
						class=SpellE>t&#7853;p</span> <span class=SpellE>và</span> <span
						class=SpellE>rèn</span> <span class=SpellE>luy&#7879;n</span>:
				</span></i></b><%=thongBaoCuThe%>
			<o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>Hy</span></span><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
				<span class=SpellE>v&#7885;ng</span> <span class=SpellE>r&#7857;ng</span>
				<span class=SpellE>vi&#7879;c</span> <span class=SpellE>cung</span>
				<span class=SpellE>c&#7845;p</span> <span class=SpellE>nh&#7919;ng</span>
				<span class=SpellE>thông</span> tin <span class=SpellE>trên</span> <span
				class=SpellE>là</span> <span class=SpellE>c&#7847;n</span> <span
				class=SpellE>thi&#7871;t</span> <span class=SpellE>&#273;&#7889;i</span>
				<span class=SpellE>v&#7899;i</span> <span class=SpellE>gia</span> <span
				class=SpellE>&#273;ình</span> <span class=SpellE>&#273;&#7875;</span>
				<span class=SpellE>công</span> <span class=SpellE>tác</span> <span
				class=SpellE>ph&#7889;i</span> <span class=SpellE>h&#7907;p</span> <span
				class=SpellE>qu&#7843;n</span> <span class=SpellE>lý</span> <span
				class=SpellE>sinh</span> <span class=SpellE>viên</span> <span
				class=SpellE>gi&#7919;a</span> <span class=SpellE>gia</span> <span
				class=SpellE>&#273;ình</span> <span class=SpellE>và</span> <span
				class=SpellE>Nhà</span> <span class=SpellE>tr&#432;&#7901;ng</span>
				<span class=SpellE>&#273;&#432;&#7907;c</span> <span class=SpellE>t&#7889;t</span>
				<span class=SpellE>h&#417;n</span> <span class=SpellE>trong</span> <span
				class=SpellE>su&#7889;t</span> <span class=SpellE>quá</span> <span
				class=SpellE>trình</span> <span class=SpellE>h&#7885;c</span> <span
				class=SpellE>t&#7853;p</span> <span class=SpellE>c&#7911;a</span> <span
				class=SpellE>sinh</span> <span class=SpellE>viên</span> <span
				class=SpellE>t&#7841;i</span> <span class=SpellE>Tr&#432;&#7901;ng</span>
				<span class=SpellE>&#272;&#7841;i</span> <span class=SpellE>h&#7885;c</span>
				<span class=SpellE>Giao</span> <span class=SpellE>Thông</span> <span
				class=SpellE>V&#7853;n</span> <span class=SpellE>T&#7843;i</span> <span
				class=SpellE>phân</span> <span class=SpellE>hi&#7879;u</span> <span
				class=SpellE>thành</span> <span class=SpellE>ph&#7889;</span> <span
				class=SpellE>H&#7891;</span> <span class=SpellE>Chí</span> Minh.<o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>N&#7871;u</span></span><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
				<span class=SpellE>ông</span> (<span class=SpellE>bà</span>) <span
				class=SpellE>mu&#7889;n</span> <span class=SpellE>bi&#7871;t</span>
				<span class=SpellE>thêm</span> <span class=SpellE>thông</span> tin <span
				class=SpellE>v&#7873;</span> <span class=SpellE>sinh</span> <span
				class=SpellE>viên</span>, <span class=SpellE>xin</span> <span
				class=SpellE>vui</span> <span class=SpellE>lòng</span> <span
				class=SpellE>liên</span> <span class=SpellE>h&#7879;</span> <span
				class=SpellE><span class=GramE>theo</span></span> <span class=SpellE>&#273;&#7883;a</span>
				<span class=SpellE>ch&#7881;</span>:<o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>H&#7885;</span></span><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
				<span class=SpellE>và</span> <span class=SpellE>tên</span> <span
				class=SpellE>c&#7889;</span> <span class=SpellE>v&#7845;n</span> <span
				class=SpellE>h&#7885;c</span> <span class=SpellE>t&#7853;p</span>: <%=tenCVHT%>
				<o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>B&#7897;</span></span><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
				<span class=SpellE>môn</span>: <%=tenDonVi%><o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>&#272;i&#7879;n</span></span><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
				<span class=SpellE>tho&#7841;i</span> <span class=SpellE>c&#417;</span>
				<span class=SpellE>quan</span>: <%=dienThoaiCoQuan%> Di <span
				class=SpellE>&#273;&#7897;ng</span>: <%=dienThoaiDiDong%><o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>&#272;&#7883;a</span></span><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
				<span class=SpellE>ch&#7881;</span> <span class=SpellE>g&#7917;i</span>
				<span class=SpellE><span class=GramE>th&#432;</span></span>: <%=!diaChiGuiThu.equals("null")?diaChiGuiThu:""%><o:p></o:p>
			</span>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><i style='mso-bidi-font-style: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>R&#7845;t</span></i></span><i
				style='mso-bidi-font-style: normal'><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
					<span class=SpellE>mong</span> <span class=SpellE>nh&#7853;n</span>
					<span class=SpellE>&#273;&#432;&#7907;c</span> <span class=SpellE>s&#7921;</span>
					<span class=SpellE>h&#7907;p</span> <span class=SpellE>tác</span> <span
					class=SpellE>hi&#7879;u</span> <span class=SpellE>qu&#7843;</span>
					<span class=SpellE>t&#7915;</span> <span class=SpellE>phía</span> <span
					class=SpellE>gia</span> <span class=SpellE>&#273;ình</span> <o:p></o:p>
			</span></i>
		</p>

		<p class=MsoNormal style='line-height: 115%'>
			<span class=SpellE><b style='mso-bidi-font-weight: normal'><i
					style='mso-bidi-font-style: normal'><span
						style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>Trân</span></i></b></span><b
				style='mso-bidi-font-weight: normal'><i
				style='mso-bidi-font-style: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
						<span class=SpellE>tr&#7885;ng</span> <span class=SpellE>c&#7843;m</span>
						<span class=SpellE>&#417;n</span>!<o:p></o:p>
				</span></i></b>
		</p>

		<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0
			width="100%"
			style='width: 100.0%; border-collapse: collapse; border: none; mso-yfti-tbllook: 1184; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: none; mso-border-insidev: none'>
			<tr
				style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
				<td width="100%" valign=top
					style='width: 100.0%; padding: 0in 5.4pt 0in 5.4pt'>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span class=SpellE><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>H&#7891;</span></span><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>
							<span class=SpellE>Chí</span> Minh, <span class=SpellE>ngày</span>
							<%=ngay%> <span class=SpellE>tháng</span> <%=thang%> <span
							class=SpellE>n&#259;m</span> <%=nam%><o:p></o:p>
						</span>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>C&#7888;
								V&#7844;N H&#7884;C T&#7852;P<o:p></o:p>
						</span></b>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'>(<span
							class=SpellE>Ký</span> <span class=SpellE>và</span> <span
							class=SpellE>ghi</span> <span class=SpellE>rõ</span> <span
							class=SpellE>h&#7885;</span> <span class=SpellE>tên</span>)<o:p></o:p></span>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span>
					</p>
					<p class=MsoNormal align=center
						style='margin-top: 0in; margin-right: 0in; margin-bottom: 0in; margin-left: 3.5in; margin-bottom: .0001pt; text-align: center; line-height: 115%'>
						<b style='mso-bidi-font-weight: normal'><span
							style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><%=tenCVHT %><o:p></o:p>
						</span></b>
					</p>
				</td>
			</tr>
		</table>

		<p class=MsoNormal
			style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 8.0pt; margin-left: 2.0in; line-height: 115%'>
			<b style='mso-bidi-font-weight: normal'><i
				style='mso-bidi-font-style: normal'><span
					style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span></i></b>
		</p>

		<p class=MsoNormal
			style='margin-top: 0in; margin-right: 2.0in; margin-bottom: 8.0pt; margin-left: 2.0in; line-height: 115%'>
			<b style='mso-bidi-font-weight: normal'><span
				style='font-size: 13.0pt; line-height: 115%; font-family: "Times New Roman", "serif"'><o:p>&nbsp;</o:p></span></b>
		</p>

	</div>

</body>

</html>
