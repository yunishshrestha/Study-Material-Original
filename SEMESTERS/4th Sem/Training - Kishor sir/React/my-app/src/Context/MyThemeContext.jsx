import { createContext, useState } from "react";

export const MyThemeContext = createContext()

export const MyThemeContextProvider = ({children}) => {
    let [theme,setTheme] = useState('light')
    // Theme is exposed for consumers; header applies its own classes.

    return <MyThemeContext.Provider value={{ theme, setTheme }}>
        {children}
    </MyThemeContext.Provider>

}