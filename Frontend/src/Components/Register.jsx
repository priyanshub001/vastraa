import React, { useState } from 'react'
import axios from 'axios'
import { useNavigate } from 'react-router-dom';

const Register = () => {

  const [user,setUser]=useState({"Username":"","Password":"","Email":"","Age":""});
 const navigator=useNavigate();
  const handleChange=(e)=>{
setUser({...user,[e.target.name]:e.target.value});
  }

  const handleSubmit=()=>{

    axios.post("http://127.0.0.1:5000/api/users/Register",user)
    .then(res=>{alert(res.data.message);
        navigator("/Login");
    })
    .catch(err=>{alert(err.response.data.error)});

  }

  return (
    <>
    
    <fieldset className="fieldset bg-base-200 border-base-300 rounded-box w-xs border p-4">
  <legend className="fieldset-legend">Login</legend>

 <label className="label">UserName</label>
  <input type="text" className="input" placeholder="Username" name='Username' value={user.Username} onChange={handleChange}/>
  <label className="label">Email</label>
  <input type="email" className="input" placeholder="Email" name='Email' value={user.Email} onChange={handleChange}/>

  <label className="label">Password</label>
  <input type="password" className="input" placeholder="Password" name='Password' value={user.Password} onChange={handleChange} />
   <label className="label">Age</label>
  <input type="number" className="input" placeholder="Age" name='Age' value={user.Age} onChange={handleChange} />

  <button className="btn btn-neutral mt-4" onClick={handleSubmit}>Login</button>

   <p>Already have an Accoutn ? <a href="/Login"><span className='text-blue-500'>Login</span></a></p>
</fieldset>
    
    </>
  )
}

export default Register