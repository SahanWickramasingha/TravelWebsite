<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - WonderLanka</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', 'Segoe UI', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #0a1628 0%, #0d4d8a 40%, #1a6b3a 70%, #0a1628 100%);
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        /* Animated background particles */
        .bg-particles {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            z-index: 0;
            pointer-events: none;
            overflow: hidden;
        }
        .particle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 215, 0, 0.15);
            animation: floatUp linear infinite;
        }
        .particle:nth-child(1) { width: 6px; height: 6px; left: 10%; animation-duration: 12s; animation-delay: 0s; }
        .particle:nth-child(2) { width: 8px; height: 8px; left: 25%; animation-duration: 15s; animation-delay: 2s; }
        .particle:nth-child(3) { width: 4px; height: 4px; left: 40%; animation-duration: 10s; animation-delay: 4s; }
        .particle:nth-child(4) { width: 10px; height: 10px; left: 55%; animation-duration: 18s; animation-delay: 1s; }
        .particle:nth-child(5) { width: 5px; height: 5px; left: 70%; animation-duration: 14s; animation-delay: 3s; }
        .particle:nth-child(6) { width: 7px; height: 7px; left: 85%; animation-duration: 16s; animation-delay: 5s; }
        .particle:nth-child(7) { width: 3px; height: 3px; left: 15%; animation-duration: 11s; animation-delay: 6s; }
        .particle:nth-child(8) { width: 9px; height: 9px; left: 95%; animation-duration: 13s; animation-delay: 2s; }
        @keyframes floatUp {
            0% { bottom: -20px; opacity: 0; transform: translateX(0); }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { bottom: 105%; opacity: 0; transform: translateX(40px); }
        }

        /* Nav */
        nav {
            background: rgba(50,50,50,0.97);
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255,215,0,0.1);
            position: relative;
            z-index: 10;
        }
		.nav-logo {
            display: flex;
            flex-direction: column;
        }
        .nav-logo .logo-text {
            font-family: 'Playfair Display', serif;
            font-style: italic;
            font-size: 28px;
            font-weight: 700;
            color: white;
            letter-spacing: 1px;
            line-height: 1.1;
        }
        .nav-logo .logo-tagline {
            font-size: 11px;
            color: rgba(255,255,255,0.5);
            letter-spacing: 1px;
            margin-top: 2px;
        }
        nav a {
            color: rgba(255,255,255,0.85);
            text-decoration: none;
            margin-left: 25px;
            transition: all 0.3s;
            font-weight: 500;
            font-size: 15px;
        }
        nav a:hover { color: #FFD700; text-shadow: 0 0 10px rgba(255,215,0,0.3); }

        /* Auth Container */
        .auth-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            position: relative;
            z-index: 5;
        }

        /* Auth Message Alert */
        .auth-message {
            position: fixed;
            top: 80px;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(135deg, rgba(255, 165, 0, 0.95), rgba(255, 100, 0, 0.95));
            color: white;
            padding: 16px 35px;
            border-radius: 16px;
            font-weight: 600;
            font-size: 15px;
            z-index: 100;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 40px rgba(255,165,0,0.3);
            animation: slideDown 0.6s ease, fadeOutMsg 0.5s ease 4s forwards;
            display: flex;
            align-items: center;
            gap: 10px;
            white-space: nowrap;
        }
        @keyframes slideDown {
            from { opacity: 0; transform: translateX(-50%) translateY(-30px); }
            to { opacity: 1; transform: translateX(-50%) translateY(0); }
        }
        @keyframes fadeOutMsg {
            to { opacity: 0; transform: translateX(-50%) translateY(-20px); pointer-events: none; }
        }

        /* Auth Box - Glass Card */
        .auth-box {
            background: rgba(255,255,255,0.03);
            border-radius: 28px;
            overflow: hidden;
            width: 100%;
            max-width: 960px;
            display: flex;
            box-shadow:
                0 30px 80px rgba(0,0,0,0.4),
                0 0 0 1px rgba(255,255,255,0.08),
                inset 0 1px 0 rgba(255,255,255,0.05);
            animation: fadeInUp 0.8s cubic-bezier(0.22, 1, 0.36, 1);
            backdrop-filter: blur(40px);
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px) scale(0.97); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        /* Left Panel */
        .auth-left {
            background: linear-gradient(165deg, rgba(13,77,138,0.95), rgba(26,107,58,0.95));
            color: white;
            padding: 60px 45px;
            width: 42%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .auth-left::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,215,0,0.1) 0%, transparent 70%);
            animation: pulseGlow 6s ease-in-out infinite;
        }
        @keyframes pulseGlow {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.2); opacity: 1; }
        }
        .auth-left > * { position: relative; z-index: 2; }
        .auth-left h2 {
            font-size: 30px;
            margin-bottom: 12px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        .auth-left p {
            opacity: 0.85;
            line-height: 1.8;
            margin-bottom: 30px;
            font-size: 15px;
            font-weight: 300;
        }
        .auth-left .emoji {
            font-size: 70px;
            margin-bottom: 25px;
            filter: drop-shadow(0 5px 15px rgba(0,0,0,0.3));
            animation: floatEmoji 3s ease-in-out infinite;
        }
        @keyframes floatEmoji {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        .auth-left .feature-badges {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 15px;
        }
        .feature-badge {
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.15);
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            backdrop-filter: blur(5px);
        }

        /* Right Panel */
        .auth-right {
            width: 58%;
            background: rgba(255,255,255,0.97);
        }

        /* Tab Buttons */
        .tab-btns {
            display: flex;
            background: #f0f3f8;
            border-bottom: 1px solid #e8ecf2;
        }
        .tab-btn {
            flex: 1;
            padding: 20px;
            border: none;
            background: transparent;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            color: #9ba3b0;
            transition: all 0.4s cubic-bezier(0.22, 1, 0.36, 1);
            border-bottom: 3px solid transparent;
            position: relative;
            letter-spacing: 0.3px;
        }
        .tab-btn.active {
            color: #0d4d8a;
            background: white;
            border-bottom: 3px solid #FFD700;
        }
        .tab-btn:hover:not(.active) {
            color: #5a6370;
            background: rgba(255,255,255,0.5);
        }

        /* Forms */
        .form-panel {
            padding: 40px 45px;
            display: none;
            animation: fadeIn 0.5s cubic-bezier(0.22, 1, 0.36, 1);
        }
        .form-panel.active { display: block; }
        @keyframes fadeIn { from { opacity: 0; transform: translateX(10px); } to { opacity: 1; transform: translateX(0); } }

        .form-panel h3 {
            font-size: 26px;
            color: #0d4d8a;
            margin-bottom: 6px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        .form-panel .subtitle {
            color: #8a94a3;
            font-size: 14px;
            margin-bottom: 28px;
            font-weight: 400;
        }

        .form-group { margin-bottom: 20px; }
        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 8px;
            letter-spacing: 0.3px;
        }
        .form-group input {
            width: 100%;
            padding: 13px 18px;
            border: 2px solid #e5e9f0;
            border-radius: 12px;
            font-size: 15px;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s cubic-bezier(0.22, 1, 0.36, 1);
            outline: none;
            background: #f8fafc;
        }
        .form-group input:focus {
            border-color: #0d4d8a;
            box-shadow: 0 0 0 4px rgba(13,77,138,0.08);
            background: white;
        }
        .form-group input::placeholder { color: #b0b8c4; }

        .form-row {
            display: flex;
            gap: 15px;
        }
        .form-row .form-group { flex: 1; }

        .submit-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #0d4d8a, #1a6b3a);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.22, 1, 0.36, 1);
            margin-top: 8px;
            letter-spacing: 0.3px;
            position: relative;
            overflow: hidden;
        }
        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0; left: -100%;
            width: 100%; height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.15), transparent);
            transition: left 0.5s;
        }
        .submit-btn:hover::before { left: 100%; }
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(13,77,138,0.35);
        }
        .submit-btn:active { transform: translateY(0); }

        .divider {
            text-align: center;
            color: #9ba3b0;
            font-size: 13px;
            margin: 22px 0;
            position: relative;
            font-weight: 500;
        }
        .divider::before, .divider::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 38%;
            height: 1px;
            background: linear-gradient(to right, transparent, #e0e0e0, transparent);
        }
        .divider::before { left: 0; }
        .divider::after { right: 0; }

        .google-btn {
            width: 100%;
            padding: 13px;
            background: white;
            border: 2px solid #e5e9f0;
            border-radius: 12px;
            font-size: 15px;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            color: #374151;
            font-weight: 600;
        }
        .google-btn:hover {
            border-color: #0d4d8a;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transform: translateY(-1px);
        }

        .forgot-link {
            text-align: right;
            margin-top: -10px;
            margin-bottom: 12px;
        }
        .forgot-link a {
            color: #0d4d8a;
            font-size: 13px;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        .forgot-link a:hover { color: #1a6b3a; }

        .terms {
            font-size: 13px;
            color: #8a94a3;
            margin-top: 18px;
            text-align: center;
            line-height: 1.6;
        }
        .terms a {
            color: #0d4d8a;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }
        .terms a:hover { color: #1a6b3a; }

        /* Footer */
        .site-footer { position: relative; color: white; z-index: 10; }
        .footer-bg {
            background: linear-gradient(135deg, #0a1a0e 0%, #0d2818 30%, #0a1628 70%, #0d1b2a 100%);
            position: relative;
        }
        .footer-bg::before {
            content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%;
            background: url('${pageContext.request.contextPath}/images/ella.jpg') center/cover no-repeat;
            opacity: 0.15; z-index: 0;
        }
        .footer-content-area {
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
        .footer-social-links { display: flex; gap: 12px; margin-top: 20px; }
        .footer-social-links a { display: flex; align-items: center; justify-content: center; width: 36px; height: 36px; border-radius: 50%; background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.12); color: white; font-size: 16px; text-decoration: none; transition: all 0.3s; padding: 0; }
        .footer-social-links a:hover { background: #FFD700; color: #000; border-color: #FFD700; transform: translateY(-3px); }
        .footer-bottom-bar { position: relative; z-index: 2; border-top: 1px solid rgba(255,255,255,0.08); padding: 20px 40px; display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto; flex-wrap: wrap; gap: 10px; }
        .footer-bottom-bar p { color: rgba(255,255,255,0.35); font-size: 13px; }
        .footer-bottom-bar-links { display: flex; gap: 20px; }
        .footer-bottom-bar-links a { color: rgba(255,255,255,0.35); text-decoration: none; font-size: 13px; transition: color 0.3s; }
        .footer-bottom-bar-links a:hover { color: #FFD700; }

        /* Responsive */
        @media (max-width: 768px) {
            .auth-box { flex-direction: column; max-width: 500px; }
            .auth-left { width: 100%; padding: 40px 30px; }
            .auth-right { width: 100%; }
            .form-panel { padding: 30px 25px; }
            .form-row { flex-direction: column; gap: 0; }
            nav { padding: 12px 20px; }
            nav a { margin-left: 15px; font-size: 14px; }
            .footer-content-area { grid-template-columns: 1fr; gap: 30px; }
            .footer-bottom-bar { flex-direction: column; text-align: center; }
        }
    </style>
</head>
<body>

<!-- Animated Background Particles -->
<div class="bg-particles">
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
</div>

<nav>
        <a href="${pageContext.request.contextPath}/home" class="nav-logo" style="text-decoration:none;">
            <span class="logo-text">WonderLanka</span>
        </a>
   
    <div>
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <a href="${pageContext.request.contextPath}/destinations">Destinations</a>
        <a href="${pageContext.request.contextPath}/booking">Book Now</a>
        <a href="${pageContext.request.contextPath}/contact">Contact</a>
        <a href="${pageContext.request.contextPath}/login" style="color: #FFD700;">Login</a>
    </div>
</nav>

<!-- Auth Message (from BookingServlet redirect) -->
<% String authMessage = (String) request.getAttribute("authMessage"); %>
<% if (authMessage != null) { %>
    <div class="auth-message">
        ⚠️ <%= authMessage %>
    </div>
<% } %>

<%
    // Check if we need to redirect after auth (e.g., came from booking page)
    String redirectTo = (String) request.getAttribute("redirectTo");
    if (redirectTo == null) redirectTo = "";

    // Check which tab should be active
    String activeTab = (String) request.getAttribute("activeTab");
    if (activeTab == null) activeTab = "login";
%>

<div class="auth-container">
    <div class="auth-box">

        <!-- Left Panel -->
        <div class="auth-left">
            <div class="emoji">🌴</div>
            <h2>Welcome to WonderLanka!</h2>
            <p>Your gateway to the most beautiful destinations in Sri Lanka. Sign in to manage your bookings and explore more.</p>
            <div class="feature-badges">
                <span class="feature-badge">🏖️ Beaches</span>
                <span class="feature-badge">🐘 Wildlife</span>
                <span class="feature-badge">🏔️ Mountains</span>
                <span class="feature-badge">🏛️ Heritage</span>
            </div>
        </div>

        <!-- Right Panel -->
        <div class="auth-right">
            <!-- Tab Buttons -->
            <div class="tab-btns">
                <button class="tab-btn <%= "login".equals(activeTab) ? "active" : "" %>" onclick="showTab('login', this)">🔑 Sign In</button>
                <button class="tab-btn <%= "signup".equals(activeTab) ? "active" : "" %>" onclick="showTab('signup', this)">✨ Sign Up</button>
            </div>

            <!-- ========== SIGN IN FORM ========== -->
            <div class="form-panel <%= "login".equals(activeTab) ? "active" : "" %>" id="login">
                <h3>Welcome Back!</h3>
                <p class="subtitle">Sign in to your LankaNavigator account</p>

                <button type="button" class="google-btn">
                    <span style="font-size:20px;">🌐</span> Continue with Google
                </button>

                <div class="divider">or sign in with email</div>

                <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
                    <!-- Hidden redirect field -->
                    <input type="hidden" name="redirect" value="<%= redirectTo %>" />

                    <div class="form-group">
                        <label>📧 Email Address</label>
                        <input type="email" name="email" placeholder="your@email.com" required>
                    </div>
                    <div class="form-group">
                        <label>🔒 Password</label>
                        <input type="password" name="password" placeholder="Enter your password" required>
                    </div>
                    <div class="forgot-link">
                        <a href="#">Forgot password?</a>
                    </div>
                    <button type="submit" class="submit-btn" id="loginBtn">✈ Sign In</button>
                </form>

                <p class="terms">
                    Don't have an account?
                    <a href="#" onclick="showTab('signup', document.querySelectorAll('.tab-btn')[1])">Sign up here</a>
                </p>
            </div>

            <!-- ========== SIGN UP FORM ========== -->
            <div class="form-panel <%= "signup".equals(activeTab) ? "active" : "" %>" id="signup">
                <h3>Create Account</h3>
                <p class="subtitle">Join WonderLanka and start exploring!</p>

                <button type="button" class="google-btn">
                    <span style="font-size:20px;">🌐</span> Continue with Google
                </button>

                <div class="divider">or sign up with email</div>

                <form action="${pageContext.request.contextPath}/signup" method="post" id="signupForm">
                    <div class="form-row">
                        <div class="form-group">
                            <label>👤 First Name</label>
                            <input type="text" name="firstName" placeholder="John" required>
                        </div>
                        <div class="form-group">
                            <label>👤 Last Name</label>
                            <input type="text" name="lastName" placeholder="Doe" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>📧 Email Address</label>
                        <input type="email" name="email" placeholder="your@email.com" required>
                    </div>
                    <div class="form-group">
                        <label>🔒 Password</label>
                        <input type="password" name="password" placeholder="Create a password" required>
                    </div>
                    <div class="form-group">
                        <label>🔒 Confirm Password</label>
                        <input type="password" name="confirmPassword" placeholder="Confirm your password" required>
                    </div>
                    <button type="submit" class="submit-btn" id="signupBtn">🌴 Create Account</button>
                </form>

                <p class="terms">
                    By signing up, you agree to our
                    <a href="#">Terms of Service</a> &
                    <a href="#">Privacy Policy</a>
                </p>
            </div>
        </div>
    </div>
</div>

<div class="site-footer">
    <div class="footer-bg">
        <div class="footer-content-area">
            <div class="footer-col">
                <h4>Address</h4>
                <p>WonderLanka Travels (Pvt) Ltd,<br>No 45, Galle Road,<br>Colombo 03, Sri Lanka.</p>
                <div class="footer-label">Phone</div><p>+94 11 234 5678</p>
                <div class="footer-label">Email</div><p>info@WonderLanka.com</p>
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
                <div class="footer-social-links"><a href="#">f</a><a href="#">📷</a><a href="#">▶</a><a href="#">in</a><a href="#">🎵</a></div>
            </div>
        </div>
        <div class="footer-bottom-bar">
            <p>© 2026 WonderLanka Travels. All rights reserved.</p>
            <div class="footer-bottom-bar-links"><a href="#">Terms & Conditions</a><a href="#">Privacy Policy</a><a href="#">Sitemap</a></div>
        </div>
    </div>
</div>

<script>
    function showTab(tab, btn) {
        // Remove active from all panels and buttons
        document.querySelectorAll('.form-panel').forEach(p => p.classList.remove('active'));
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));

        // Activate selected tab
        document.getElementById(tab).classList.add('active');
        if (btn) btn.classList.add('active');
    }

    // Form submit loading animation for Sign In
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        var btn = document.getElementById('loginBtn');
        btn.textContent = '⏳ Signing in...';
        btn.style.opacity = '0.8';
        btn.style.pointerEvents = 'none';
    });

    // Form submit loading animation for Sign Up
    document.getElementById('signupForm').addEventListener('submit', function(e) {
        // Client-side password match check
        var pwd = this.querySelector('[name="password"]').value;
        var cpwd = this.querySelector('[name="confirmPassword"]').value;
        if (pwd !== cpwd) {
            e.preventDefault();
            alert('Passwords do not match! Please try again.');
            return false;
        }
        var btn = document.getElementById('signupBtn');
        btn.textContent = '⏳ Creating account...';
        btn.style.opacity = '0.8';
        btn.style.pointerEvents = 'none';
    });
</script>

</body>
</html>