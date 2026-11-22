import React, { useContext, useEffect, useState } from 'react';
import PersonalCard from '../components/PersonalCard';
import { MyContext } from '../Context/MyContext';

const Counter = () => {
    const [count, setCount] = useState(0);
    const [data, setData] = useState(100);

    useEffect(() => {
        alert("Value Updated")
    }, [])
    // useEffect(()=>{
    //     alert("Value Updated")
    // },[count,data])

    const increaseCount = () => {
        setCount(prev => prev + 1);
    };

    let msg = useContext(MyContext)
    return (
        <div
            style={{ minHeight: '80vh' }}
            className='d-flex justify-content-center align-items-center flex-column'
        >
            <h1>{msg}</h1>
            <h1>Counter: {count}</h1>

            {count < 20 && (
                <button
                    className='btn btn-success'
                    onClick={increaseCount}
                >
                    Increase
                </button>
            )}

            <button
                className='btn btn-warning'
                disabled={count === 0}
                onClick={() => setCount(prev => prev - 1)}
            >
                Decrease
            </button>

            <button
                className='btn btn-danger'
                onClick={() => setCount(0)}
            >
                Reset
            </button>

            <h2>Data: {data}</h2>

            <div className='btn-group'>

                <button
                    className='btn btn-success'
                    onClick={() => setData(prev => prev - 10)}
                >
                    -
                </button>

                <button
                    className='btn btn-danger'
                    onClick={() => setData(100)}
                >
                    RESET
                </button>

                <button className='btn btn-warning'onClick={() => setData(prev => prev + 10)}>+</button>
            </div>
            <PersonalCard name='Yunus' address = 'Kathmandu' phone='9827959552'/>
            <PersonalCard name='Arpu' address='Jhapa' phone='9762904137'/>
            <PersonalCard name='Sahu' address='Dhading' phone='9826959552'/>

        </div>
    );
};

export default Counter;