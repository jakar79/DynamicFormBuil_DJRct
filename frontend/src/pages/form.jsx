import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Link, useParams, useNavigate } from 'react-router-dom';

const Form = () => {
    const [formName, setFormName] = useState("");
    const [sections, setSections] = useState([]);
    const { formId } = useParams();
    const navigate = useNavigate();


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
    const handleFieldChange = (e, sectionIndex, fieldIndex) => {
        const updatedSections = [...sections];
        updatedSections[sectionIndex].form_fields[fieldIndex][e.target.name] = e.target.value;
        setSections(updatedSections);
    };
    const handleAddField = (sectionIndex) => {
        const newField = {
            label: "",
            field_type: "text",
            choices: [],
        };
        const updatedSections = [...sections];
        updatedSections[sectionIndex].form_fields.push(newField);
        setSections(updatedSections);
    };
    const handleDeleteField = (sectionIndex, fieldIndex) => {
        const updatedSections = [...sections];
        updatedSections[sectionIndex].form_fields.splice(fieldIndex, 1);
        setSections(updatedSections);
    };
    const handleAddOption = (sectionIndex, fieldIndex) => {
        const updatedSections = [...sections];
        updatedSections[sectionIndex].form_fields[fieldIndex].choices.push({});
        setSections(updatedSections);
    };
    const handleOptionChange = (e, sectionIndex, fieldIndex, optionIndex) => {
        const updatedSections = [...sections];
        updatedSections[sectionIndex].form_fields[fieldIndex].choices[optionIndex] =
            { choice_text: e.target.value };
        setSections(updatedSections);
    };
    const handleDeleteOption = (sectionIndex, fieldIndex, optionIndex) => {
        const updatedSections = [...sections];
        updatedSections[sectionIndex].form_fields[fieldIndex].choices.splice(optionIndex, 1);
        setSections(updatedSections);
    };
    const handleSubmit = (e) => {
        e.preventDefault();
        const data = {
            name: formName,
            sections: sections
        };
        console.log(data);
        if(formId) {
            // Update form
            axios.put(`/api/forms/${formId}/`, data).then((response) => {
                console.log("Form Updated successfully", response);
                navigate("/");
            });
        } else {
            // Create form
            axios.post(`/api/forms/`, data).then((response) => {
                console.log("Form Created successfully", response);
                setFormName("");
                setSections([]);
                navigate("/");
            });
        }
    };
    console.log(sections);



    return (
        <div className='container'>
            <div className='d-flex my-3'>
                <div className='me-auto'>
                    <h3>{formId ? "Edit form" : "Create Form"}</h3>
                </div>
                <div className=''>
                    <Link to={"/"} className='btn btn-outline-primary'>
                        Forms
                    </Link>
                </div>
            </div>
            <form onSubmit={handleSubmit}>
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
                                        value={section.name?section.name : `Section ${sectionIndex + 1}`}
                                        className='form-control'
                                        onChange={(e) => handleSectionNameChange(e, sectionIndex)}
                                    />
                                </div>
                            </div>
                        </div>
                        <ul className="list-group my-2">
                            {section.form_fields.map((field, fieldIndex) => (
                                <li key={fieldIndex} className="list-group-item">
                                    <div className="row">
                                        <div className="col-3">
                                            <div className="input-group">
                                                <span className="input-group-text">Label</span>
                                                <input
                                                    type="text"
                                                    className="form-control"
                                                    name="label"
                                                    id={fieldIndex}
                                                    value={field.label}
                                                    onChange={(e) => handleFieldChange(e, sectionIndex, fieldIndex)}
                                                />
                                            </div>
                                        </div>
                                        <div className="col-3">
                                            <div className="input-group">
                                                <span className="input-group-text">Type</span>
                                                <select
                                                    name="field_type"
                                                    defaultValue={field.field_type}
                                                    className="form-select"
                                                    onChange={(e) => handleFieldChange(e, sectionIndex, fieldIndex)}
                                                >
                                                    <option value="">Select Type</option>
                                                    <option value="text">Text</option>
                                                    <option value="password">Password</option>
                                                    <option value="radio">Radio</option>
                                                    <option value="checkbox">Checkbox</option>
                                                    <option value="select">Select</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div className="col-6">
                                            {field.field_type !== '' && (
                                                <button
                                                    className='btn btn-danger'
                                                    type='button'
                                                    onClick={() => handleDeleteField(sectionIndex, fieldIndex)}
                                                >
                                                    Delete
                                                </button>
                                            )}
                                        </div>
                                        <div className="col-6">
                                            {["radio", "checkbox", "select"].includes(field.field_type) && (
                                                <ul className='list-group my-2'>
                                                    {field.choices.map((option, optionIndex) => (
                                                        <li className="list-group-item" key={optionIndex}>
                                                            <div className="row">
                                                                <div className="col-9">
                                                                    <input
                                                                        type="text"
                                                                        name='option'
                                                                        className="form-control"
                                                                        value={option.choice_text}
                                                                        onChange={(e) => handleOptionChange(e, sectionIndex, fieldIndex, optionIndex)}
                                                                    />
                                                                </div>
                                                                <div className="col-3">
                                                                    <button
                                                                        className='btn btn-sm btn-danger'
                                                                        type='button'
                                                                        onClick={() => handleDeleteOption(sectionIndex, fieldIndex, optionIndex)}
                                                                    >
                                                                        Delete
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    ))}
                                                </ul>
                                            )}
                                        </div>
                                        <div className="col-12">
                                            {["radio", "checkbox", "select"].includes(field.field_type) && (
                                                <button
                                                    className='btn btn-outline-success'
                                                    type='button'
                                                    onClick={() => handleAddOption(sectionIndex, fieldIndex)}
                                                >
                                                    Add Option
                                                </button>
                                            )}
                                        </div>
                                    </div>
                                </li>
                            ))}
                        </ul>
                        <div className="d-flex my-3">
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
                <div className="d-flex my-3">
                    <div className="me-auto p-2">
                        <button
                            className='btn btn-primary'
                            type='button'
                            onClick={handleAddSection}>
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