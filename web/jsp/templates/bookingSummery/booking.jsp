<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="inputs">

<div class="bookingHeading form-standard">
    <div class="label1 label">Booking Number :</div>
    <div class="value1 value">${sessionScope.bookingDetails.booking.bookingNumber}</div>
    <div class="label2 label">Booking Date and Time :</div>
    <fmt:formatDate
            value="${sessionScope.bookingDetails.booking.bookingDate}"
            var="formattedBookingDate"
            pattern="MM/dd/yyyy"></fmt:formatDate>
    <fmt:formatDate
            value="${sessionScope.bookingDetails.booking.bookingTime}"
            var="formattedBookingTime"
            pattern="HH:MM"></fmt:formatDate>
    <div class="value2 value">${formattedBookingDate} ${formattedBookingTime}</div>
</div>

<div class="upTripSummery tripSummery form-standard" id="upTripSummery">

    <div class="tripSummeryHeading subHeading">
        <div>Outbound Details</div>
        <div>(${sessionScope.bookingDetails.booking.fromAirport.code}
            - ${sessionScope.bookingDetails.booking.toAirport.code})
        </div>
    </div>

    <c:forEach items="${sessionScope.bookingDetails.scheduleTicketsListUpTrips}" var="element">
        <c:set var="i" value="1"/>
        <div class="transitHeading">
            <div class="label label">Schedule :</div>
            <div class="value">${element.transitNumber} (${element.schedule.from.code}
                - ${element.schedule.to.code})
            </div>
            <div class="label">Departure :</div>
            <fmt:formatDate
                    value="${element.schedule.departDate}"
                    var="formattedDepartureDate"
                    pattern="MM/dd/yyyy"></fmt:formatDate>
            <fmt:formatDate
                    value="${element.schedule.departTime}"
                    var="formattedDepartTime"
                    pattern="HH:MM"></fmt:formatDate>
            <div class="value">${formattedDepartureDate} ${formattedDepartTime}</div>
            <div class="label">Arrival :</div>
            <fmt:formatDate
                    value="${element.schedule.arrivalDate}"
                    var="formattedArrivalDate"
                    pattern="MM/dd/yyyy"></fmt:formatDate>
            <fmt:formatDate
                    value="${element.schedule.arrivalTime}"
                    var="formattedArrivalTime"
                    pattern="HH:MM"></fmt:formatDate>
            <div class="value">${formattedArrivalDate} ${formattedArrivalTime}</div>
        </div>
        <div class="tableOfTickets">
            <table class="tickets" border="1">
                <th>Ticket Number</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Other Name</th>
                <th>Passport Number</th>
                <th>Status</th>
                <th>&nbsp;</th>
                <c:forEach items="${element.adultTickets}" var="ticket">
                    <tr id="${ticket.tickerNumberARS}">
                        <td>${ticket.ticketNumber}</td>
                        <td>${ticket.passenger.firstName}</td>
                        <td>${ticket.passenger.lastName}</td>
                        <td>${ticket.passenger.otherName}</td>
                        <td>${ticket.passenger.passportNumber}</td>
                        <td>${ticket.status}</td>
                        <td class="cancel-button"  id="${ticket.tickerNumberARS}">
                            <c:if test="${ticket.status=='SCHEDULED'}">
                                Cancel
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${element.childTickets}" var="ticket">
                    <tr id="${ticket.tickerNumberARS}">
                        <td>${ticket.ticketNumber}</td>
                        <td>${ticket.passenger.firstName}</td>
                        <td>${ticket.passenger.lastName}</td>
                        <td>${ticket.passenger.otherName}</td>
                        <td>${ticket.passenger.passportNumber}</td>
                        <td>${ticket.status}</td>
                        <td class="cancel-button"  id="${ticket.tickerNumberARS}">
                            <c:if test="${ticket.status=='SCHEDULED'}">
                                Cancel
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${element.infantTickets}" var="ticket">
                    <tr id="${ticket.tickerNumberARS}">
                        <td>${ticket.ticketNumber}</td>
                        <td>${ticket.passenger.firstName}</td>
                        <td>${ticket.passenger.lastName}</td>
                        <td>${ticket.passenger.otherName}</td>
                        <td>${ticket.passenger.passportNumber}</td>
                        <td>${ticket.status}</td>
                        <td class="cancel-button"  id="${ticket.tickerNumberARS}">
                            <c:if test="${ticket.status=='SCHEDULED'}">
                                Cancel
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <c:set var="i" value="${i+1}"/>
    </c:forEach>

</div>

<c:if test="${fn:length(sessionScope.bookingDetails.scheduleTicketsListDownTrips)>0}">
    <div class="downTripSummery tripSummery form-standard" id="downTripSummery">

        <div class="tripSummeryHeading subHeading">
            <div>Inbound Details</div>
            <div>(${sessionScope.bookingDetails.booking.toAirport.code}
                - ${sessionScope.bookingDetails.booking.fromAirport.code})
            </div>
        </div>

        <c:forEach items="${sessionScope.bookingDetails.scheduleTicketsListDownTrips}" var="element">

            <div class="transitHeading">
                <div class="label">Schedule :</div>
                <div class="value">${element.transitNumber} (${element.schedule.from.code}
                    - ${element.schedule.to.code})
                </div>
                <div class="label">Departure :</div>
                <fmt:formatDate
                        value="${element.schedule.departDate}"
                        var="formattedDepartureDate"
                        pattern="MM/dd/yyyy"></fmt:formatDate>
                <fmt:formatDate
                        value="${element.schedule.departTime}"
                        var="formattedDepartTime"
                        pattern="HH:MM"></fmt:formatDate>
                <div class="value">${formattedDepartureDate} ${formattedDepartTime}</div>
                <div class="label">Arrival :</div>
                <fmt:formatDate
                        value="${element.schedule.arrivalDate}"
                        var="formattedArrivalDate"
                        pattern="MM/dd/yyyy"></fmt:formatDate>
                <fmt:formatDate
                        value="${element.schedule.arrivalTime}"
                        var="formattedArrivalTime"
                        pattern="HH:MM"></fmt:formatDate>
                <div class="value">${formattedArrivalDate} ${formattedArrivalTime$}</div>
            </div>
            <div class="tableOfTickets">
                <table class="tickets" border="1" >
                    <th>Ticket Number</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Other Name</th>
                    <th>Passport Number</th>
                    <th>Status</th>
                    <th>&nbsp;</th>
                    <c:forEach items="${element.adultTickets}" var="ticket">
                        <tr id="${ticket.tickerNumberARS}">
                            <td>${ticket.ticketNumber}</td>
                            <td>${ticket.passenger.firstName}</td>
                            <td>${ticket.passenger.lastName}</td>
                            <td>${ticket.passenger.otherName}</td>
                            <td>${ticket.passenger.passportNumber}</td>
                            <td>${ticket.status}</td>
                            <td class="cancel-button" id="${ticket.tickerNumberARS}">
                                <c:if test="${ticket.status=='SCHEDULED'}">
                                    Cancel
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${element.childTickets}" var="ticket">
                        <tr id="${ticket.tickerNumberARS}">
                            <td>${ticket.ticketNumber}</td>
                            <td>${ticket.passenger.firstName}</td>
                            <td>${ticket.passenger.lastName}</td>
                            <td>${ticket.passenger.otherName}</td>
                            <td>${ticket.passenger.passportNumber}</td>
                            <td>${ticket.status}</td>
                            <td class="cancel-button"  id="${ticket.tickerNumberARS}">
                                <c:if test="${ticket.status=='SCHEDULED'}">
                                    Cancel
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${element.infantTickets}" var="ticket">
                        <tr id="${ticket.tickerNumberARS}">
                            <td>${ticket.ticketNumber}</td>
                            <td>${ticket.passenger.firstName}</td>
                            <td>${ticket.passenger.lastName}</td>
                            <td>${ticket.passenger.otherName}</td>
                            <td>${ticket.passenger.passportNumber}</td>
                            <td>${ticket.status}</td>
                            <td class="cancel-button"  id="${ticket.tickerNumberARS}">
                                <c:if test="${ticket.status=='SCHEDULED'}">
                                    Cancel
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <c:set var="i" value="${i+1}"/>
        </c:forEach>

    </div>
</c:if>

<div class="contactPersonDetail form-standard" id="contactPerson">
    <div class="passengerNumberLable">
        <p>Contact Information</p>
    </div>
    <div class="line">
        <div class="label">
            <p>First Name</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactFirstName" type="text" disabled value="${sessionScope.bookingDetails.booking.contactPerson.firstName}" class="firstName"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>Last Name</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactLastName" type="text" disabled value="${sessionScope.bookingDetails.booking.contactPerson.lastName}" class="lastName"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>Other Name</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactOtherName" type="text" disabled value="${sessionScope.bookingDetails.booking.contactPerson.otherName}" class="otherName"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>E-mail</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactEmail" type="email" disabled value="${sessionScope.bookingDetails.booking.contactPerson.email}" class="email"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>Address Line 1</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactAddressLine1" type="text" value="${sessionScope.bookingDetails.booking.contactPerson.addressLine1}" disabled class="addressLine1"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>Address Line 2</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactAddressLine2" type="text" value="${sessionScope.bookingDetails.booking.contactPerson.addressLine2}" disabled class="addressLine2"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>Address Line 3</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactAddressLine3" type="text" value="${sessionScope.bookingDetails.booking.contactPerson.addressLine3}" disabled class="addressLine3"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>Country</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactAddressLineCountry" disabled value="${sessionScope.bookingDetails.booking.contactPerson.country}" type="text" class="addressLineCountry"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>Contact Number 1</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactNumber1" type="text" disabled value="${sessionScope.bookingDetails.booking.contactPerson.contactNumber1}" class="contactNumber"/></p>
        </div>
    </div>
    <div class="line">
        <div class="label">
            <p>Contact Number 2</p>
        </div>
        <div class="separator">
            <p>:</p>
        </div>
        <div class="input">
            <p><input name="contactNumber2" type="text" disabled value="${sessionScope.bookingDetails.booking.contactPerson.contactNumber2}" class="contactNumber"/></p>
        </div>
    </div>
</div>


<div class="buttonSection line">
    <div class="float-right submitPassengerInfoButton">
        <p><input class="button-standard-size button-default" type="submit" name="submit"
                  value="Start New Booking"></p>
    </div>
</div>


</div>