<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>카카오페이 결제취소</title>
</head>
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<link rel="stylesheet" href="${path}/resources/paymentstyle/paySuccess.css" />
<body>
	<section class="cart">
		<div class="cart__information">결제가 취소되었습니다.</div>
		<table class="cart__list">
			<form>
				<thead>
					<tr>

						<td colspan="1">결제일시</td>
						<td>주문번호</td>
						<td>상품명</td>
						<td>상품수량</td>
						<td>결제금액</td>
						<td>결제방법</td>
					</tr>
				</thead>
				<tbody>
					<tr class="cart__list__detail">

						<td class="cart__list__option"></td>
						<td class="cart__list__option"></td>
						<td class="cart__list__option"></td>
						<td class="cart__list__option"></td>
						<td class="cart__list__option"></td>
						<td class="cart__list__option"></td>

					</tr>
				</tbody>

			</form>
		</table>
	</section>
</body>
</html>