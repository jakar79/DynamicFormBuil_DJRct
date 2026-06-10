import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Link, useParams } from 'react-router-dom';

const Form = () => {
    const [formName, setFormName] = useState("");
    const [sections, setSections] = useState([]);
    const { formId } = useParams();

    useEffect(() => {
        const getFormData = async () => {
            const response = await axios.get("/api/forms/" + formId);
            const { name, sections } = response.data;
            setFormName(name);
            setSections(sections);
            console.log(response.data);
        };
        if (formId) getFormData();
    }, [formId]);

    const handleAddSection = () => {
        const newSection = {
            name: "",
            form_fields: [],
        };
        setSections([...sections, newSection]);
    };

    console.log(sections);

    return (
        <div className='container'>
            <div className='d-flex my-5'>
                <div className='me-auto'>
                    <h1>{formId ? "Edit form" : "Create Form"}</h1>
                </div>
                <div className=''>
                    <Link to={"/"} className='btn btn-outline-primary'>
                        Forms
                    </Link>
                </div>
            </div>
            <form>
                <div className='row'>
                    <div className='col-md-12'>
                        <div className="form-group">
                            <label htmlFor="formName">Form Name</label>
                            <input type="text" name='formName' id='formName' placeholder='Enter form name' value={formName} />
                        </div>
                    </div>
                </div>
                <hr />
                {sections.map((section, sectionIndex) => (
                    <div key={sectionIndex}>
                        <div className='d-flex my-5'>
                            <div className='me-auto'>
                                <h1>
                                    {section.name ? section.name : `Section ${sectionIndex + 1}`}
                                </h1>
                            </div>
                            <div className=''>
                                <button className="btn btn-sm btn btn-danger">
                                    Delete
                                </button>
                            </div>
                        </div>
                    </div>
                ))}
                <div className="d-flex">
                    <div className="me-auto p-2">
                        <button className='btn btn-primary' type='button' onClick={handleAddSection}>
                            Add Section
                        </button>
                    </div>
                    <div className="p-2">
                        <button type='submit' className='btn btn-primary'>
                            {formId ? "Update Form" : "Create Form"}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    );
};
export default Form;