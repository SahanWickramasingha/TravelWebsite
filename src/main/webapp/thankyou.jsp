<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thank You - WonderLanka</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', 'Segoe UI', sans-serif; background: #f0f4f8; }

        /* ===== NAV ===== */
        nav {
            background: rgba(50,50,50,0.97);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255,255,255,0.08);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 12px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .nav-logo { display: flex; flex-direction: column; text-decoration: none; }
        .nav-logo .logo-text {
            font-family: 'Playfair Display', serif;
            font-style: italic;
            font-size: 28px;
            font-weight: 700;
            color: white;
            letter-spacing: 1px;
            line-height: 1.1;
        }
        .nav-logo .logo-tagline { font-size: 11px; color: rgba(255,255,255,0.5); letter-spacing: 1px; margin-top: 2px; }
        .nav-menu { display: flex; align-items: center; gap: 8px; }
        .nav-menu a {
            color: white; text-decoration: none; font-size: 13px; font-weight: 600;
            letter-spacing: 1.5px; text-transform: uppercase; padding: 8px 14px;
            transition: all 0.3s; position: relative;
        }
        .nav-menu a::after {
            content: ''; position: absolute; bottom: 2px; left: 50%; transform: translateX(-50%);
            width: 0; height: 2px; background: #FFD700; transition: width 0.3s;
        }
        .nav-menu a:hover { color: #FFD700; }
        .nav-menu a:hover::after { width: 60%; }
        .nav-menu a.active-link { color: #FFD700; }
        .nav-menu a.active-link::after { width: 60%; }
        .nav-actions { display: flex; align-items: center; gap: 12px; }
        .nav-inquire-btn {
            background: rgba(255,255,255,0.12); border: 1px solid rgba(255,255,255,0.25);
            color: white; padding: 8px 22px; border-radius: 25px; font-size: 12px;
            font-weight: 700; letter-spacing: 1.2px; text-transform: uppercase;
            text-decoration: none; transition: all 0.3s; display: flex; align-items: center; gap: 6px;
        }
        .nav-inquire-btn:hover { background: #FFD700; color: #000; border-color: #FFD700; }
        .nav-profile-link {
            color: #FFD700; text-decoration: none; font-size: 13px; font-weight: 600;
            display: flex; align-items: center; gap: 5px; transition: all 0.3s;
        }
        .nav-profile-link:hover { color: white; }
        .nav-logout-btn {
            color: rgba(255,255,255,0.6); text-decoration: none; font-size: 12px;
            font-weight: 500; letter-spacing: 1px; text-transform: uppercase; transition: color 0.3s;
        }
        .nav-logout-btn:hover { color: #ff6b6b; }

        .thank-container {
            max-width: 650px;
            margin: 100px auto;
            background: white;
            border-radius: 20px;
            padding: 60px;
            text-align: center;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
            animation: popIn 0.8s ease;
        }
        @keyframes popIn {
            from { opacity: 0; transform: scale(0.8); }
            to { opacity: 1; transform: scale(1); }
        }

        .check-icon {
            font-size: 80px;
            animation: bounce 1s ease infinite alternate;
        }
        @keyframes bounce {
            from { transform: translateY(0); }
            to { transform: translateY(-15px); }
        }

        h1 { font-size: 40px; color: #1a6b3a; margin: 20px 0 10px; }
        .name { font-size: 24px; color: #0d4d8a; font-weight: bold; margin: 10px 0; }
        p { color: #666; font-size: 16px; line-height: 1.8; margin: 10px 0; }

        .details-box {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
            margin: 30px 0;
            text-align: left;
        }
        .details-box p {
            font-size: 15px;
            padding: 6px 0;
            border-bottom: 1px solid #eee;
        }
        .details-box p:last-child { border-bottom: none; }
        .details-box strong { color: #0d4d8a; }

        .home-btn {
            display: inline-block;
            background: linear-gradient(135deg, #FFD700, #FFA500);
            color: #000;
            padding: 14px 40px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            margin-top: 20px;
            transition: transform 0.3s;
        }
        .home-btn:hover { transform: scale(1.05); }

        /* ===== FOOTER ===== */
        .site-footer { position: relative; color: white; }
        .footer-bg {
            background: linear-gradient(135deg, #0a1a0e 0%, #0d2818 30%, #0a1628 70%, #0d1b2a 100%);
            position: relative;
        }
        .footer-bg::before {
            content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%;
            background: url('${pageContext.request.contextPath}/images/ella.jpg') center/cover no-repeat;
            opacity: 0.15; z-index: 0;
        }
        .footer-content {
            position: relative; z-index: 2; max-width: 1200px; margin: 0 auto;
            padding: 70px 40px 50px; display: grid; grid-template-columns: 1fr 1.5fr 1fr; gap: 50px;
        }
        .footer-col h4 { font-size: 13px; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; color: rgba(255,255,255,0.5); margin-bottom: 25px; }
        .footer-col p { color: rgba(255,255,255,0.7); font-size: 14px; line-height: 1.9; margin-bottom: 8px; }
        .footer-col .footer-label { color: rgba(255,255,255,0.4); font-size: 12px; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; margin-top: 20px; margin-bottom: 6px; }
        .footer-col a { color: rgba(255,255,255,0.7); text-decoration: none; font-size: 14px; transition: all 0.3s; display: block; padding: 5px 0; }
        .footer-col a:hover { color: #FFD700; padding-left: 5px; }
        .footer-links-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 0 30px; }
        .footer-newsletter-input { display: flex; margin-top: 5px; }
        .footer-newsletter-input input { flex: 1; padding: 12px 18px; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.15); border-right: none; border-radius: 8px 0 0 8px; color: white; font-size: 14px; outline: none; font-family: 'Inter', sans-serif; }
        .footer-newsletter-input input::placeholder { color: rgba(255,255,255,0.3); }
        .footer-newsletter-input button { padding: 12px 20px; background: #FFD700; border: none; border-radius: 0 8px 8px 0; color: #000; font-weight: 700; cursor: pointer; font-size: 16px; transition: background 0.3s; }
        .footer-newsletter-input button:hover { background: #FFA500; }
        .footer-payment { display: flex; gap: 8px; margin-top: 20px; flex-wrap: wrap; }
        .payment-icon { background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.15); padding: 5px 10px; border-radius: 4px; font-size: 12px; font-weight: 700; color: white; }
        .footer-social { display: flex; gap: 12px; margin-top: 20px; }
        .footer-social a { display: flex; align-items: center; justify-content: center; width: 36px; height: 36px; border-radius: 50%; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.12); color: white; font-size: 16px; text-decoration: none; transition: all 0.3s; padding: 0; }
        .footer-social a:hover { background: #FFD700; color: #000; border-color: #FFD700; transform: translateY(-3px); }
        .footer-bottom { position: relative; z-index: 2; border-top: 1px solid rgba(255,255,255,0.08); padding: 20px 40px; display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto; flex-wrap: wrap; gap: 10px; }
        .footer-bottom p { color: rgba(255,255,255,0.35); font-size: 13px; }
        .footer-bottom-links { display: flex; gap: 20px; }
        .footer-bottom-links a { color: rgba(255,255,255,0.35); text-decoration: none; font-size: 13px; transition: color 0.3s; }
        .footer-bottom-links a:hover { color: #FFD700; }

        @media (max-width: 768px) {
            .nav-menu { display: none; }
            .footer-content { grid-template-columns: 1fr; gap: 30px; }
            .footer-bottom { flex-direction: column; text-align: center; }
        }
    </style>
</head>
<body>

<nav>
    <div class="nav-container">
        <a href="${pageContext.request.contextPath}/home" class="nav-logo" style="text-decoration:none;">
            <span class="logo-text">WonderLanka</span>
            <span class="logo-tagline">www.wonderlanka.com</span>
        </a>
        <div class="nav-menu">
            <a href="${pageContext.request.contextPath}/home">HOME</a>
            <a href="${pageContext.request.contextPath}/destinations">DESTINATIONS</a>
            <a href="${pageContext.request.contextPath}/booking">BOOK NOW</a>
            <a href="${pageContext.request.contextPath}/contact">CONTACT</a>
        </div>
        <div class="nav-actions">
            <% if (session.getAttribute("userLoggedIn") != null) { %>
                <a href="${pageContext.request.contextPath}/profile" class="nav-profile-link">👤 <%= session.getAttribute("userName") %></a>
                <a href="${pageContext.request.contextPath}/logout" class="nav-logout-btn">LOGOUT</a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/login" class="nav-inquire-btn">🔑 SIGN IN</a>
            <% } %>
        </div>
    </div>
</nav>

<div class="thank-container">
    <div class="check-icon">✅</div>
    <h1>Booking Confirmed!</h1>
    <p class="name">Thank you, <%= request.getAttribute("name") %>!</p>
    <p>Your trip has been successfully booked. We will contact you shortly with your travel details.</p>

    <div class="details-box">
        <p><strong>📧 Destination:</strong> <%= request.getParameter("destination") %></p>
        <p><strong>📅 Travel Date:</strong> <%= request.getParameter("travelDate") %></p>
        <p><strong>👥 Persons:</strong> <%= request.getParameter("persons") %></p>
        <p><strong>📦 Package:</strong> <%= request.getParameter("package") %></p>
    </div>

    <a href="/TravelWebsite/home" class="home-btn">🏠 Back to Home</a>
</div>

<div class="site-footer">
    <div class="footer-bg">
        <div class="footer-content">
            <div class="footer-col">
                <h4>Address</h4>
                <p>WonderLanka Travels (Pvt) Ltd,<br>No 45, Galle Road,<br>Colombo 03, Sri Lanka.</p>
                <div class="footer-label">Phone</div><p>+94 11 234 5678</p>
                <div class="footer-label">Email</div><p>info@wonderlanka.com</p>
            </div>
            <div class="footer-col">
                <h4>Quick Links</h4>
                <div class="footer-links-grid">
                    <div>
                        <a href="${pageContext.request.contextPath}/home">Home</a>
                        <a href="${pageContext.request.contextPath}/destinations">Destinations</a>
                        <a href="${pageContext.request.contextPath}/booking">Book Now</a>
                        <a href="${pageContext.request.contextPath}/contact">Contact Us</a>
                    </div>
                    <div>
                        <a href="#">Sri Lanka Tours</a><a href="#">Sri Lanka Guide</a>
                        <a href="#">Special Offers</a><a href="#">Reviews</a>
                    </div>
                </div>
            </div>
            <div class="footer-col">
                <h4>Newsletter</h4>
                <div class="footer-newsletter-input"><input type="email" placeholder="Enter your email address"><button>➤</button></div>
                <div class="footer-label">Our Payment Partners</div>
                <div class="footer-payment"><span class="payment-icon">VISA</span><span class="payment-icon">MC</span><span class="payment-icon">AMEX</span><span class="payment-icon">PayPal</span></div>
                <div class="footer-social"><a href="#">f</a><a href="#">📷</a><a href="#">▶</a><a href="#">in</a><a href="#">🎵</a></div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2026 WonderLanka Travels. All rights reserved.</p>
            <div class="footer-bottom-links"><a href="#">Terms & Conditions</a><a href="#">Privacy Policy</a><a href="#">Sitemap</a></div>
        </div>
    </div>
</div>

</body>
</html>