import React, { useEffect } from "react";
import axios from "axios";
import { Link, useParams } from "react-router-dom";

const FormDetail = () => {
    const { formId } = useParams();
    const [form, setForm] = React.useState(null);

    useEffect(() => {
        axios
            .get(`/api/forms/${formId}/`)
            .then((response) => setForm(response.data))
            .catch(error => {
                console.error(error);
            });
    }, [formId]);
    if (!form) {
        return <div>Loading...</div>;
    }

    return (
        <div className="container my-5">

            <div className="row">
                <div className="col-md-8 mx-auto">
                    <div className="d-flex">
                <div className="me-auto">
                    <h1>{form?.name || "Loading..."}</h1>
                </div>
                <div>
                    <Link to={"/"} className="btn btn-outline-primary">Forms</Link>
                </div>
            </div>
                    {form?.sections.map(section => (
                        <div className="card" key={section.id}>
                            <div className="card-header" id={`section-${section.id}`}>
                                <h5>{section.name}</h5>
                            </div>
                            <div className="card-body">
                                {section.form_fields.map((field) => {
                                    const name = `field-${section.id}-${field.id}`;
                                    const choices = field.choices.map((choice) => (
                                        <option key={choice.id} value={choice.choice_text}>
                                            {choice.choice_text}
                                        </option>
                                    ));
                                    switch (field.field_type) {
                                        case 'text':
                                            return (
                                                <div key={field.id}>
                                                    <label htmlFor={name} className="form-label">{field.label}</label>
                                                    <input type="text"
                                                        id={name}
                                                        name={name}
                                                        className="form-control"
                                                    />
                                                </div>
                                            );
                                        case 'password':
                                            return (
                                                <div key={field.id}>
                                                    <label htmlFor={name} className="form-label">{field.label}</label>
                                                    <input type="password"
                                                        id={name}
                                                        name={name}
                                                        className="form-control"
                                                    />
                                                </div>
                                            );
                                        case 'select':
                                            return (
                                                <div key={field.id}>
                                                    <label htmlFor={name} className="form-label">{field.label}</label>
                                                    <select id={name} name={name} className="form-control">
                                                        <option value="">Select an option</option>
                                                        {choices}
                                                    </select>
                                                </div>
                                            );
                                        case 'radio':
                                        case 'checkbox':
                                            return (
                                                <div key={field.id}>
                                                    <label htmlFor={name} className="form-label">
                                                        {field.label}
                                                    </label>
                                                    {choices.map((choice) => {
                                                        const choiceName = `${name}_${choice.id}`;
                                                        return (
                                                            <div className="form-check" key={choice.key}>
                                                                <input
                                                                    type={field.field_type}
                                                                    name={name}
                                                                    id={choiceName}
                                                                    value={choice.props.value}
                                                                />
                                                                    <label
                                                                        htmlFor={choiceName}
                                                                        className="form-check-label"
                                                                    >
                                                                        {choice.props.children}
                                                                    </label>
                                                                </div>
                                                            );
                                                        })}
                                                        {field.required && <span className="text-danger">*</span>}

                                                </div>
                                            );
                                        default:
                                            return null;
                                    }

                                })}
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
};

export default FormDetail;
