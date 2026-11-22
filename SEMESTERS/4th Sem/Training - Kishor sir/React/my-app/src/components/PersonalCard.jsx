import React from 'react'

const PersonalCard = (props) => {
    let person={
        name:"Yunus",address:"Kathmandu",phone:"9827959552"
    }

  return (
    <div className='p-5 shadow-ig rounded m-3'>
        <h1>Name: {props.name}</h1>
        <h2>Addres: {props.address}</h2>
        <h2>Phone: {props.phone}</h2>
    </div>
  )
}

export default PersonalCard