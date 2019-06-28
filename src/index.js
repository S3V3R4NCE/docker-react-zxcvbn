/*
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();
*/

import React, { Component } from 'react';
import zxcvbn from 'zxcvbn';
import ReactDOM from 'react-dom'
import './index.css';
import './style.css';
import registerServiceWorker from './registerServiceWorker';

var custom_dict = "january,february,march,april,may,june,july,august,september,ACME,AKME".split(",")

class ShowPassword extends Component{
    constructor(props){
      super(props);
      this.state = {
        type: 'input',
        score: 'null',
        verbal: ''
      }
      this.showHide = this.showHide.bind(this);
      this.passwordStrength = this.passwordStrength.bind(this);
    }
    
    showHide(e){
      e.preventDefault();
      e.stopPropagation();
      this.setState({
        type: this.state.type === 'input' ? 'password' : 'input'
      })  
    }
    
    passwordStrength(e){
      if(e.target.value === ''){
        this.setState({
          score: 'null'
        })
        this.setState({
          verbal: ''
        })
      }
      else{
        var pw = zxcvbn(e.target.value,custom_dict);
        this.setState({
          score: pw.score
        }); 
        this.verbalStrength(pw.score)
      }
      
    }

    verbalStrength(s){
      switch (s) {
        case 0:
          this.setState({
            verbal: 'Weak'
          })
          break;
        case 1:
          this.setState({
            verbal: 'Weak'
          })
          break;
        case 2:
          this.setState({
            verbal: 'Better'
          })
          break;
        case 3:
          this.setState({
            verbal: 'Almost There'
          })
          break;
        case 4:
          this.setState({
            verbal: 'Strong'
          })
          break;
        default:
          this.setState({
            verbal: ''
          })
      }
    }
    
    render(){
      return(
        <div>
          <label className="password">Create a strong password!
          <input type={this.state.type} className="password__input" onChange={this.passwordStrength}/>
          <span className="password__show" onClick={this.showHide}>{this.state.type === 'input' ? 'Hide' : 'Show'}</span>
          <span className="password__strength" data-score={this.state.score} />
          <span className="password__strength__verbal" verbal-score={this.state.verbal}>{this.state.verbal}</span>
          </label>
        </div>
      )
    }
  }

  
ReactDOM.render(<ShowPassword/>, document.getElementById('meter'));
registerServiceWorker();
