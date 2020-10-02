# Github Member module

## Requirements
| Name | Version |                                                                                                                                                                                                 
|------|---------|                                                                                                                                                                                                 
| terraform | >= 0.13.0 |                                                                                                                                                                                         
| aws | ~> 3.0 |                                                                                                                                                                                                   
                                                                                                                                                                                                                   
## Providers                                                                                                                                                                                                       
                                                                                                                                                                                                                   
| Name | Version |                                                                                                                                                                                                 
|------|---------|                                                                                                                                                                                                 
| [Github](https://registry.terraform.io/providers/hashicorp/github/latest/docs)  | ~> 3.0.0 
## Inputs

| Variable | Type | Description |
| --- | --- | --- |
| commons | set(string) | (Required) A list of commons members |
| admins | set(string) | (Optional) A list of admin members |

## Outputs

| Output | Description |
| --- | --- |
| membership | The full membership object |
