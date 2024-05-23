<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Submission of attendance</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<style>
         @font-face {
            font-family: 'Coolvetica';
            src: url('CoolveticaRg-Regular.woff2') format('woff2'),
                 url('CoolveticaRg-Regular.woff') format('woff');
            font-weight: bold;
        }
        h2 {
            font-size: 30px;
            font-family: Coolvetica;
            text-align: center;
            word-break: break-word;
            margin: 0;
            z-index: 1;
            color: black;
            
        }
        h2 span {
            display: inline-block;
            transition: color 0.3s ease;
        }
        h2 span:hover {
            color: white;
        }
        .fade-in-up {
            opacity: 0;
            transform: translateY(50px);
            transition: opacity 1s ease, transform 3s ease;
        }
        .fade-in-up.visible {
            opacity: 1;
            transform: translateY(0);
        }
        @media (max-width: 768px) {
            h3{
            	font-size: 30px;
            }
            
        }
	    .container {
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        height: 100vh;
	        
	        
	    }
	    .content {
	        text-align: center;
	        z-index: -1;
	    }

	    .borderless {
	        border: none;
	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Adjust shadow as needed */
	       
	    }
	
	    .rounded {
	        border-radius: 10px; /* Example border radius */
	    }
	    p{
	    	color:black;
	    }
	    body {
            /* Set the background image */
            background-image: url('effect.gif');
            /* Center and cover the background */
            background-position: center;
            background-size: cover;
            
        }
			
        
    </style>
</head>
<% 
    String status = request.getParameter("status");
    String[] colors = request.getParameterValues("color");
    String address = request.getParameter("address");
%>
<%! 
    public String getMessage(String status, String[] colors, String address) {
        String message = " ";
        if (status != null && status.equalsIgnoreCase("1")) {
            if (colors != null && colors.length > 0) {
                message = "You should wear ";
                for (int i = 0; i < colors.length; i++) {
                    message += colors[i];
                    if (i < colors.length - 1) {
                        message += ", ";
                    }
                }
                message += " colors if you are able to come to our open house event.";
            } else {
                message = "No color preference specified.";
            }
        } else {
            message = "We'll miss you at the open house, but hope to catch you next time!";
        }
        return message;
    }
%>
<body>
<div class="container">
 	<div class="content">
	    <h2>Thank you for your response, <%=request.getParameter("name")%> !</h2>
	    <div class="mt-5 p-4 borderless rounded justify">
	        <p><b>Name: </b><%=request.getParameter("name")%></p>
	        <p><b>Age: </b><%=request.getParameter("age")%></p>
	        <p><b>Address: </b><%=address%></p>
	        <p><b>Gender: </b><%=request.getParameter("gender")%></p>
	        <p style="text-align: center; font-weight: bold;">
	             <%= getMessage(status, colors, address) %>
	    	</p>
	    </div>
	</div>
</div>

</body>
</html>