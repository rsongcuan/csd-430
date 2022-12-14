<%@ page language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>

<HTML>
<BODY>

<c:import var="xml" url="sample.xml"/>
<x:parse varDom="dom" xml="${xml}"/>
<x:forEach var="person" select="$dom/database/person">
<x:set var="attrPersonId"       select="string($person/@id)"/>
<x:set var="dataName"           select="string($person/name/text())"/>
<x:set var="dataEmail"          select="string($person/email/text())"/>
<x:set var="dataPhone"          select="string($person/phone/text())"/>
<x:set var="attrAddressCity"    select="string($person/address/@city)"/>
<x:set var="attrAddressState"   select="string($person/address/@state)"/>
<x:set var="attrAddressZip"     select="string($person/address/@zip)"/>
<x:set var="attrAddressCountry" select="string($person/address/@country)"/>
<x:set var="dataAddressLine1"   select="string($person/address/line1/text())"/>
<x:set var="dataAddressLine2"   select="string($person/address/line2/text())"/>
<P> ID:      <c:out value="${attrPersonId}"/>
<BR>Name:    <c:out value="${dataName}"/>
<BR>Email:   <c:out value="${dataEmail}"/>
<BR>Phone:   <c:out value="${dataPhone}"/>
<BR>City:    <c:out value="${attrAddressCity}"/>
<BR>State:   <c:out value="${attrAddressState}"/>
<BR>ZIP:     <c:out value="${attrAddressZip}"/>
<BR>Country: <c:out value="${attrAddressCountry}"/>
<BR>Line1:   <c:out value="${dataAddressLine1}"/>
<BR>Line2:   <c:out value="${dataAddressLine2}"/>
</x:forEach>
<c:remove var="xml"/>
<c:remove var="dom"/>

</BODY>
</HTML>
