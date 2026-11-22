import React from 'react'
import { Outlet } from 'react-router-dom'
import Header from './Header'
import Footer from './Footer'

const Layout = () => {
    return (
        <>
            <Header />
            <div className='min-h-[80vh]'>
                <Outlet />
            </div>
            <Footer />
        </>
    )
}

export default Layout