function Navbar() {
    return (
        <nav className="navbar">
            <div className="logo">
                J<span>Flow</span>
                </div>

<div className="nav-links">
                    <a href="/">Home</a>
                    <a href="/about">Order Water</a>
                    <a href="/contact">My Orders</a>
                    <a href="/contact">About</a>
                </div>
                <button className="login-btn">Login</button>
            </nav>
        );
}

export default Navbar;