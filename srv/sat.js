const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
    // Set Fieldcontrol during creation
    this.before("CREATE", "materials", async (req) => {
        req.data.Fieldcontrol = 3; // Editable during create
    });

    // Update Fieldcontrol during edit
    this.before("UPDATE", "materials", async (req) => {
        const existingMaterial = await cds.run(
            SELECT.one.from("com.org.satinfotech.Materials").where({ ID: req.data.ID })
        );

        if (!existingMaterial) {
            req.reject(404, "Material not found.");
        }

        // Example: Make editable based on a condition
        if (existingMaterial.quantity > 50) {
            req.data.Fieldcontrol = 3; // Editable
        } else {
            req.data.Fieldcontrol = 1; // Read-only
        }
    });
});
