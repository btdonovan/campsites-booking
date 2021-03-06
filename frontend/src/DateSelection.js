import React from 'react';

//Dates available to choose from
const DateSelection = (props) => {
    return (
      <div id="dateSelection">
        <label htmlFor="date">Start date...</label>
        <select name='date' id='date' onChange={props.onChange}>
          <option value='2020-07-11'>July 11</option>
          <option value='2020-07-12'>July 12</option>
          <option value='2020-07-13'>July 13</option>
          <option value='2020-07-14'>July 14</option>
          <option value='2020-07-15'>July 15</option>
        </select>
      </div>
    )
  }

  export default DateSelection