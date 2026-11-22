import React from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { DECREMENT, INCREMENT, RESET } from '../redux/counterReducer'

const ReduxCounter = () => {
  const count = useSelector((state) => state.count)
  const dispatch = useDispatch()

  return (
    <div className='d-flex flex-column align-items-center p-5 my-5 gap-3'>
      <h2>Counter: {count}</h2>
      <div className='d-flex gap-2'>
        <button className='btn btn-primary' onClick={() => dispatch({ type: INCREMENT })}>
          Increase
        </button>
        <button className='btn btn-danger' onClick={() => dispatch({ type: DECREMENT })}>
          Decrease
        </button>
        <button className='btn btn-secondary' onClick={() => dispatch({ type: RESET })}>
          Reset
        </button>
      </div>
    </div>
  )
}

export default ReduxCounter