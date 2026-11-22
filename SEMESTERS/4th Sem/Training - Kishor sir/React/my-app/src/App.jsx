import React from 'react'
import './App.css'
import MyRouter from './MyRouter'
import { MyContextProvider } from './Context/MyContext'
import { MyThemeContextProvider } from './Context/MyThemeContext'
import { MyStoreProvider } from './redux/store'

const App = () => {
  return (

    <>
      <MyStoreProvider>

        <MyThemeContextProvider>
          {/* React fragment <> </> */}
          <MyContextProvider>

            <MyRouter />

          </MyContextProvider>
        </MyThemeContextProvider>
      </MyStoreProvider>

    </>

  )
}
export default App












