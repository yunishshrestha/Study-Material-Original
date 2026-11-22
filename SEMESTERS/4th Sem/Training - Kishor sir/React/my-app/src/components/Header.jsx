import React, { useContext } from 'react';
import { MyThemeContext } from '../Context/MyThemeContext';

const Header = () => {
  const { theme, setTheme } = useContext(MyThemeContext);
  return (
    <>
      <nav className={`navbar navbar-expand-lg bg-${theme} header-${theme}`}>
        <div className="container-fluid">
          <a className={`navbar-brand navbar-brand-${theme}`} href="#">
            Navbar
          </a>

          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>

          <div
            className="collapse navbar-collapse"
            id="navbarSupportedContent"
          >
            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
              <li className="nav-item">
                <a className={`nav-link nav-link-${theme} active`} aria-current="page" href="#">
                  Home
                </a>
              </li>

              <li className="nav-item">
                <a className={`nav-link nav-link-${theme}`} href="#">
                  Link
                </a>
              </li>

              <li className="nav-item dropdown">
                <a
                  className={`nav-link dropdown-toggle nav-link-${theme}`}
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  Dropdown
                </a>

                <ul className="dropdown-menu">
                  <li>
                    <a className="dropdown-item" href="#">
                      Action
                    </a>
                  </li>

                  <li>
                    <a className="dropdown-item" href="#">
                      Another action
                    </a>
                  </li>

                  <li>
                    <hr className="dropdown-divider" />
                  </li>

                  <li>
                    <a className="dropdown-item" href="#">
                      Something else here
                    </a>
                  </li>
                </ul>
              </li>

              <li className="nav-item">
                <a className={`nav-link disabled nav-link-${theme}`} aria-disabled="true">
                  Disabled
                </a>
              </li>
            </ul>

            <form className="d-flex me-3" role="search">
              <input
                className="form-control me-2"
                type="search"
                placeholder="Search"
                aria-label="Search"
              />
              <button className="btn btn-outline-success" type="submit">
                Search
              </button>
            </form>

            <button
              className={`btn ${theme === 'light' ? 'btn-dark' : 'btn-light'}`}
              onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}
            >
              {theme === 'light' ? 'Dark Mode' : 'Light Mode'}
            </button>
          </div>
        </div>
      </nav>
    </>
  );
};

export default Header;