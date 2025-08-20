import "./App.css";
import logo from "./assets/santospedia-logo.jpeg";
import background from "./assets/background.jpg";

function App() {
  return (
    <div
      className="app"
      style={{ backgroundImage: `url(${background})` }}
    >
      <div className="overlay">
        <img src={logo} alt="Santospedia Logo" className="logo" />
        <h1 className="title">Santospedia</h1>
        <p className="subtitle">Nosso site está em construção.</p>
        <p className="description">Em breve, o maior acervo sobre o Santos FC estará no ar!</p>
      </div>
    </div>
  );
}

export default App;