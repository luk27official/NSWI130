workspace patient-monitor-control {

	model {

        patientDatabaseSystem = softwareSystem "Central Hospital Patient Database System" "Central hospital database system containing info about patients."
        drugDatabaseSystem = softwareSystem "Drugs Database System" "Drugs database system containing info about drugs (possibly from drug management)."

		pmcSystem = softwareSystem "Patient Monitor Control System" "System for monitoring patients in hospital" {

			server = container "Server" "Controls the main logic" {

                group gateways {
                    devices_gateway = component "Devices Gateway" "Gateway for devices data access"
                    patient_gateway = component "Patient Gateway" "Gateway for patient data access"
                    drugs_gateway = component "Drugs Gateway" "Gateway for drugs data access"
                }

                controller = component "Controller" "Controls the main logic" {
                    -> devices_gateway "Sends requests to devices gateway"
                    -> patient_gateway "Sends requests to patient gateway" 
                    -> drugs_gateway "Sends requests to drugs gateway"
                }

                group apis {
                    user_API = component "User API" "API for user interaction (without privileges)" {
                        -> controller "Sends commands to"
                    }

                    staff_API = component "Staff API" "API for staff interaction (with privileges)" {
                        -> controller "Sends commands to"
                    }

                    devices_API = component "Devices API" "API for devices interaction" {
                        -> controller "Sends commands to"
                    }
                }

                group services {
                    notification_service = component "Notification Service" "Service for sending notifications"
                    devices_service = component "Devices Service" "Service for managing devices and getting their data"
                    personnel_service = component "Personnel Service" "Service for managing personnel"
                    patient_service = component "Patient Service" "Service for managing patients"
                    drugs_service = component "Drugs Service" "Service for managing drugs"

                    controller -> notification_service "Sends requests to notification service"
                    controller -> personnel_service "Sends requests to personnel service"
                    controller -> patient_service "Sends requests to patient service"
                    controller -> drugs_service "Sends requests to drugs service"
                    controller -> devices_service "Sends requests to devices service"
                }
			}

            security_gate = container "Security Gate" "Security gate for controlling access to the system and checking validity of requests" {
                -> devices_API "Sends verified requests to" "HTTPS"
                -> staff_API "Sends verified requests to" "HTTPS"
                -> user_API "Sends verified requests to" "HTTPS"
            }

            group interfaces {
                user_interface = container "User Web Interface" "Provides web interface for users" {
                    -> security_gate "Sends requests to" "HTTPS"
                }

                staff_interface = container "Staff Web Interface" "Provides web interface for staff" {
                    -> security_gate "Sends requests to" "HTTPS"
                }

                devices_interface = container "Devices Web Interface" "Provides some interface for devices" {
                    -> security_gate "Sends requests to" "HTTPS"
                }
            }

            group custom_databases {
                device_records = container "Device Records" "Database for storing devices records"
                //drugs_db = container "Drugs Database" "Database for storing drugs records"
                patient_db = container "Patient Database" "Database for storing patients records" 
            }

            patient_db_synchronizer = container "Patient DB synchronizer" "Patient DB synchronizer"

            devices_gateway -> device_records "Requests data from" "HTTPS"
            patient_gateway -> patient_db "Requests data from" "HTTPS"
            patient_db -> patient_db_synchronizer "Synchronizes with" "HTTPS"
            patient_db_synchronizer -> patientDatabaseSystem "Synchronizes with" "HTTPS"
            //drugs_gateway -> drugs_db "Requests data from"
            drugs_gateway -> drugDatabaseSystem "Requests data from" "HTTPS"
		}
		
		# stakeholders

		it_staff = person "IT staff" "People responsible for IT infrastructure" {
			-> staff_interface "Manages"
            -> user_interface "Manages"
            -> devices_interface "Manages"
		}

        doctor = person "Doctor" "Hospital doctor responsible i.e. for drug prescription" {
            -> staff_interface "Uses"
        }

        nurse = person "Nurse" "Nurse responsible for patient wellbeing" {
            -> staff_interface "Uses"
        }

        patient = person "Patient" "Patient lying in hospital bed" {
            -> user_interface "Uses"
        }

        technician = person "Technician" "Technicians responsible for devices maintenance" {
            -> staff_interface "Manages"
            -> devices_interface "Manages"
        }

        # deployment

        deploymentEnvironment "Live"   {
            deploymentNode "User's device" "" "Common OS (Windows, Linux, Mac)" {
                deploymentNode "Web Browser" "" "Common browser (Chrome, Firefox, Safari)" {
                    containerInstance user_interface
                }
            }
            deploymentNode "Staff's device" "" "Common OS (Windows, Linux, Mac)" {
                deploymentNode "Web Browser" "" "Common browser (Chrome, Firefox, Safari)"   {
                    containerInstance staff_interface
                }
            }
            deploymentNode "Devices' staff/technician device" "" "Common OS (Windows, Linux, Mac)"  {
                deploymentNode "Web Browser" "" "Common browser (Chrome, Firefox, Safari)"   {
                    containerInstance devices_interface
                }
            }
            deploymentNode "Patient Monitor Control System Runtime" "" "Patient Monitor Control System"  {
                deploymentNode "PMC-server" "" "Ubuntu 22.04.1 LTS" "" 4 {
                    deploymentNode "Node.js" "" "Node.js 18.12.*" {
                        containerInstance server
                    }
                }
                deploymentNode "PMC-security_gate" "" "Ubuntu 22.04.1 LTS" "" {
                    deploymentNode "Node.js" "" "Node.js 18.12.*" {
                        containerInstance security_gate
                    }
                }
                deploymentNode "PMC-device_records" "" "Ubuntu 22.04.1 LTS"  {
                    deploymentNode "Apache CouchDB" "" "Apache CouchDB 3.*"   {
                        containerInstance device_records
                    }
                }
                deploymentNode "PMC-patient_db" "" "Ubuntu 22.04.1 LTS"  {
                    deploymentNode "Apache CouchDB" "" "Apache CouchDB 3.*"   {
                        containerInstance patient_db
                    }
                }
                deploymentNode "PMC-patient_db_synchronizer" "" "Ubuntu 22.04.1 LTS" "" {
                    deploymentNode "Node.js" "" "Node.js 18.12.*" {
                        containerInstance patient_db_synchronizer
                    }
                }
            }
            deploymentNode "External central patient database system" {
                softwareSystemInstance patientDatabaseSystem
            }
            deploymentNode "External drug database system" {
                softwareSystemInstance drugDatabaseSystem
            }
        }
    }

	views {

		systemContext pmcSystem "pmc-system-context" {
			include *
			autoLayout
		}

		container pmcSystem "pmc-system-container" {
			include *
			autoLayout
		}

		component server "pmc-server-component" {
			include *
			autoLayout
		}

        deployment pmcSystem "Live" {
            include *
        }

		styles {
			element "Person" {
				shape person
				background #0033ff
				color #ffffff
			}

			element "Software System" {
				background #4290f5
			}

			element "Container" {
				background #1fffbc
			}

			element "Component" {
				background #47ff6f
			}
		}
	}	
}
