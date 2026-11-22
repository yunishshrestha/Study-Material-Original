import React from 'react'
import { useParams } from 'react-router-dom'

const MyProfile = () => {
    const params = useParams()
    //{username: 'ram'}
  return (
    <div>
        Welcome {params.username}
    </div>
  )
}

export default MyProfile