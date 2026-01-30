import axios from 'axios';
import React, { useEffect,useState } from 'react'

const UserProfile = () => {

  const [user,setUser]=useState({"Username":"","Email":"","Age":""});
 const Token=localStorage.getItem("Token");
  useEffect(()=>{
  

    axios.get("http://127.0.0.1:5000/api/users/Profile",{headers:{Authorization:`Bearer ${Token}`}})
    .then(res=>{setUser(res.data.data)})
    .catch(error=>{console.log(error.response.data.error)});
  },[]);
  return (
   <>
   
   <div className=''>


    <p>{user.Username}</p>
    <p>{user.Email}</p>
    <p>{user.Age}</p>
   </div>
   
   
   
   
   
   </>
  )
}

export default UserProfile