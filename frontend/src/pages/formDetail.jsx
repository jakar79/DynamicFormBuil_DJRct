import React, { useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";

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
        <div className="container">
            <h1>{form?.name || "Loading..."}</h1>
            <div className="row">
                <div className="col-md-8 mx-auto">
                    {form?.sections.map(section => (
                        <div className="card" key={section.id}>
                            <div className="card-header" id={`section-${section.id}`}>
                                <h5>{section.name}</h5>
                            </div>
                            <div className="card-body">
                                {section.form_fields.map((field) => (
                                    <div key={field.id}>
                                        <label>{field.label}</label>
                                        <input type="text" />
                                    </div>
                                ))}
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
};

export default FormDetail;
