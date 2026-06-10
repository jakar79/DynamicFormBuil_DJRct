import React from 'react';
import "bootstrap/dist/css/bootstrap.min.css";
import Forms from './pages/forms';
import FormDetail from './pages/formDetail';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Form from './pages/form';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Forms />} />
        <Route path="/forms/:formId/details" element={<FormDetail />} />
        <Route path="/forms/:formId/edit" element={<Form />} />
        <Route path="/form/create" element={<Form />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
