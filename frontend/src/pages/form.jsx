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
    const handleDeleteSection = (sectionIndex) => {
        const updatedSections = [...sections];
        updatedSections.splice(sectionIndex, 1);
        setSections(updatedSections);
    };
    const handleSectionNameChange = (e, sectionIndex) => {
        const updatedSections = [...sections];
        updatedSections[sectionIndex].name = e.target.value;
        setSections(updatedSections);
    };
    const handleFieldLabelChange = (e, sectionIndex, fieldIndex) => {
        const updatedSections = [...sections];
        updatedSections[sectionIndex].form_fields[fieldIndex][e.target.name] = e.target.value;
        setSections(updatedSections);
    };
    const handleAddField = (sectionIndex) => {
        const updatedSections = [...sections];
        const newField = {
            label: "",
            field_type: "text",
            choices: [],
        };
        updatedSections[sectionIndex].form_fields.push(newField);
        setSections(updatedSections);
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
                            <input
                                type="text"
                                name='formName'
                                id='formName'
                                placeholder='Enter form name'
                                className='form-control'
                                value={formName}
                                onChange={(e) => setFormName(e.target.value)}
                            />
                        </div>
                    </div>
                </div>
                <hr />
                {sections.map((section, sectionIndex) => (
                    <div key={sectionIndex}>
                        <div className='d-flex py-5'>
                            <div className='me-auto'>
                                <h4>
                                    {`Section ${sectionIndex + 1}`}
                                </h4>
                            </div>
                            <div className=''>
                                <button
                                    className="btn btn-sm btn btn-danger"
                                    type='button'
                                    onClick={() => handleDeleteSection(sectionIndex)}>
                                    Delete
                                </button>
                            </div>
                        </div>
                        <div className='row'>
                            <div className='col-md-12'>
                                <div className='from-group'>
                                    <label htmlFor={`sectionName${sectionIndex}`}>Section Name</label>
                                    <input
                                        type="text"
                                        name={`sectionName${sectionIndex}`}
                                        id={`sectionName${sectionIndex}`}
                                        placeholder='Enter section name'
                                        value={section.name ? section.name : `Section ${sectionIndex + 1}`}
                                        className='form-control'
                                        onChange={(e) => handleSectionNameChange(e, sectionIndex)}
                                    />
                                </div>
                            </div>
                        </div>
                        <ul className="llist-group my-2">
                            {section.form_fields && section.form_fields.map((field, fieldIndex) => (
                                <li key={fieldIndex} className="list-group-item">
                                    <div className="row">
                                        <div className="col-3">
                                            <div className="input-group">
                                                <span className="input-group-text">Label</span>
                                                <input
                                                    type="text"
                                                    className="form-control"
                                                    name={`fieldLabel${sectionIndex}${fieldIndex}`}
                                                    id={`fieldLabel${sectionIndex}${fieldIndex}`}
                                                    placeholder='Enter Section Name'
                                                    value={field.label}
                                                    onChange={(e) => handleFieldLabelChange(e, sectionIndex, fieldIndex)}
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            ))}
                        </ul>
                        <div className="d-flex">
                            <button
                                className='btn btn-outline-primary w-100'
                                type='button'
                                onClick={() => handleAddField(sectionIndex)}
                            >
                                Add Field
                            </button>
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