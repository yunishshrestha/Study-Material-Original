import { combineReducers, createStore } from 'redux'
import { Provider } from 'react-redux'
import { counterReducer } from './counterReducer'
import { personReducer } from './personReducer'

// export const myStore = createStore(counterReducer)

const rootReducer = combineReducers({
    counterStore: counterReducer,
    personStore: personReducer
})
export const myStore = createStore(rootReducer)

export const MyStoreProvider = ({ children }) => {
    return <Provider store={myStore}>{children}</Provider>
}