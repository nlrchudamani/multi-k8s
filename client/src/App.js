import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import otherPage from './otherPage'
import Fib from './Fib'

function App() {
  return (
    <Router>
      <div className="App">
      <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <Link to="/">Home</Link>
          <Link to="/otherPage">Other Page </Link>

         
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        </header>
         <div>
            <Route exact path="/" component={Fib}></Route>
            <Route path="/otherpage" component={otherPage}></Route>
        </div>
    </div>
    </Router>
    
  );
}

export default App;
